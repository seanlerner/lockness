module Lockness
  class Decrypt

    attr_reader :encrypted_file

    def initialize(path:)
      @encrypted_file = EncryptedFile.new(path: path)

      file_not_found unless encrypted_file.exist?
    end

    def decrypt
      Content.new(encrypted_file: encrypted_file).plain
    end

    private

    def file_not_found
      raise "Could not find the file '#{encrypted_file.path}'"
    end

  end
end
