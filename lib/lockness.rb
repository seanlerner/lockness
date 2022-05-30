module Lockness

  def self.start
    EnsureMasterKeyGitIgnored.new.ensure_master_key_git_ignored

    if ARGV.first == 'init' && ARGV.count == 1
      MasterKey.new.generate
    elsif ARGV.first == 'edit' && ARGV.count == 2
      Edit.new.edit
    elsif ARGV.first == 'show' && ARGV.count == 2
      Show.new.show
    elsif ARGV.first == 'help' && ARGV.count == 1 || ARGV.none?
      Help.show
    else
      puts "Unable to process arguments: '#{ARGV.join(' ')}'"
      exit 1
    end
  end

end
