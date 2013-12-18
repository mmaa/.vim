require 'fileutils'

desc 'update git submodules'
task :default do
  Dir['bundle/*'].each do |dir|
    FileUtils.cd(dir) do
      puts dir
      `git pull`
      puts "\n"
    end
  end
end
