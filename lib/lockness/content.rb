module Lockness
  class Content

    attr_reader :encrypted_file,
                :message_encryptor,
                :encrypted

    def initialize(encrypted_file:)
      @encrypted_file    = encrypted_file
      @message_encryptor = ActiveSupport::MessageEncryptor.new(MasterKey.new.read)
      @encrypted         = encrypted_file.read
    end

    def plain
      message_encryptor.decrypt_and_verify(encrypted)

    rescue ActiveSupport::MessageVerifier::InvalidSignature => exception
      puts "Unable to decrypt using the master.key."
      puts
      puts "Please double check that the master.key is correct."

      exit 1
    end

    def update(new_plain_content)
      ensure_content(new_plain_content)

      encrypted_content = message_encryptor.encrypt_and_sign(new_plain_content)

      encrypted_file.save(encrypted_content)
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
