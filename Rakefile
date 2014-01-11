require 'fileutils'

desc 'update git submodules'
task :default do
  Dir['bundle/*'].each do |dir|
    FileUtils.cd(dir) do
      puts "\033[34;47m\033[1m #{dir.split('/').last} \033[0m"
      `git pull`
      puts "\n"
    end
  end
end
