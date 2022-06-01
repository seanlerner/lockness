module Lockness
  module Setup

    def self.setup
      require 'active_support/all'
      require 'base64'
      require 'digest/sha2'
      require 'openssl'
      require 'securerandom'
      require 'tempfile'

      require_relative '../lockness'

      Dir.glob("#{__dir__}/*.rb").each do |file|
        require_relative file
      end
    end

  end
end
