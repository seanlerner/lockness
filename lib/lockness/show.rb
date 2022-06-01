module Lockness
  class Show

    attr_reader :encrypted_file

    def initialize
      @encrypted_file = EncryptedFile.new(path: PathBuilder.path)
    end

    def show
      if encrypted_file.exist?
        puts Content.new(encrypted_file: encrypted_file).plain
      else
        puts "No file at #{encrypted_file.encrypted_path}"

        exit 1
      end
    end

    private

    def build_path
      path_arg = ARGV.last

      if path_arg.starts_with?('/')
        path_arg
      else
        File.join(Dir.pwd, path_arg)
      end
    end

  end
end
