module Lockness
  class Content

    attr_reader :secret_file,
                :message_encryptor,
                :encrypted

    def initialize
      @secret_file       = SecretFile.new
      @message_encryptor = ActiveSupport::MessageEncryptor.new(MasterKey.new.read)
      @encrypted         = secret_file.read
    end

    def plain
      message_encryptor.decrypt_and_verify(encrypted)
    end

    def update(new_plain_content)
      ensure_content(new_plain_content)

      encrypted_content = message_encryptor.encrypt_and_sign(new_plain_content)

      secret_file.save(encrypted_content)
    end

    private

    def ensure_content(new_plain_content)
      return if new_plain_content.present?

      puts 'No content provided.'
      puts 'Aborting!'

      exit 1
    end

  end
end
