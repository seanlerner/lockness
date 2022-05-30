module Lockness
  class Show

    attr_reader :secret_file

    def initialize
      @secret_file = SecretFile.new
    end

    def show
      if secret_file.exist?
        puts Content.new.plain
      else
        puts "No file at #{secret_file.encrypted_path}"

        exit 1
      end
    end

  end
end
