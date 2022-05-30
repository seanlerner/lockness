module Lockness
  module Help

    def self.show
      puts help
    end

    def self.help
      <<~HELP
        USAGE:

        lockness init                 # generates a master.key
        lockness edit  <filename>     # create or edit a new file
        lockness show  <filename>     # view an encrypted file
        lockness                      # show this help
      HELP
    end

  end
end
