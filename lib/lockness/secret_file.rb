module Lockness
  class SecretFile

    attr_reader :path

    def initialize
      @path = build_path
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
