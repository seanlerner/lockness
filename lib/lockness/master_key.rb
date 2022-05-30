module Lockness
  class MasterKey

    def read
      ensure_exists

      File.read(path)
    end

    def generate
      ensure_does_not_exist

      master_key = SecureRandom.hex

      File.write(path, master_key)

      puts "Generated master key and saved at #{path}"
    end

    def path
      "#{Dir.pwd}/master.key"
    end

    def exist?
      File.exist?(path)
    end

    private

    def ensure_exists
      return if exist?

      puts "Expected to find #{path}"
      puts 'Run `lockness init` to generate a master.key'
      exit 1
    end

    def ensure_does_not_exist
      return unless exist?

      puts "Master key already exists at #{path}!"
      puts 'Please delete and try again'

      exit 1
    end

  end
end
