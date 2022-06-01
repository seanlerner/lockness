module Lockness
  module PathBuilder

    def self.path
      path_arg = ARGV.last

      if path_arg.starts_with?('/')
        path_arg
      else
        File.join(Dir.pwd, path_arg)
      end
    end

  end
end
