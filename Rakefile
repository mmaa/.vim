require 'fileutils'

desc 'update git submodules'
task :default do
  Dir['bundle/*'].each do |dir|
    next if dir == "." || dir == ".."
    FileUtils.cd(dir) do
      `git pull origin master`
    end
  end
end
