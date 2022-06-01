module Lockness
  class EncryptedFile

    attr_reader :path

    def initialize(path:)
      @path = path
    end

    def exist?
      File.exist?(encrypted_path)
    end

    def unencrypted_path
      path.chomp('.enc')
    end

    def encrypted_path
      if path.ends_with?('.enc')
        path
      else
        "#{path}.enc"
      end
    end

    def read
      return unless exist?

      File.read(encrypted_path)
    end

    def save(encrypted_content)
      File.write(encrypted_path, encrypted_content)
    end

  end
end
