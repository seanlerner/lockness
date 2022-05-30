module Lockness
  class EnsureMasterKeyGitIgnored

    def ensure_master_key_git_ignored
      master_key = MasterKey.new

      return unless git_repo?
      return unless master_key.exist?
      return if ignored_files.include?('master.key')

      puts "You must git ignore #{master_key.path} to use lockness."

      exit 1
    end

    def ignored_files
      files = `git status --short --ignored`

      files.split("\n")
           .select { |status_line| status_line.starts_with?('!!') }
           .map    { |status_line| status_line.split.last }
    end

    def git_repo?
      `git -C #{Dir.pwd} rev-parse 2>/dev/null; echo $?`.chomp == '0'
    end

  end
end
