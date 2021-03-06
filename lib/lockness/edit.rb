module Lockness
  class Edit

    attr_reader :encrypted_file,
                :content,
                :temp_file

    def initialize
      @encrypted_file = EncryptedFile.new(path: PathBuilder.path)
      @content     = Content.new(encrypted_file: encrypted_file)
      @temp_file   = Tempfile.new
    end

    def edit
      ensure_temp_file_deleted

      if encrypted_file.exist?
        edit_existing
      else
        edit_new
      end

      puts "File saved: #{encrypted_file.encrypted_path}"
    end

    private

    def edit_new
      open_temp_file_in_editor
      plain_content = temp_file.read
      content.update(plain_content)
    end

    def edit_existing
      temp_file.write(content.plain)
      temp_file.close
      open_temp_file_in_editor
      plain_content = File.read(temp_file.path)
      content.update(plain_content)
    end

    def open_temp_file_in_editor
      `#{ENV.fetch('EDITOR')} #{temp_file.path}`
    end

    def ensure_temp_file_deleted
      at_exit do
        temp_file.unlink
      end
    end

  end
end
