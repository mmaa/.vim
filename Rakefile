require 'fileutils'

desc 'update git submodules'
task :default do
  Dir['bundle/*'].each do |dir|
    branch = dir == "bundle/powerline" ? 'develop' : 'master'

    FileUtils.cd(dir) do
      `git pull origin #{branch}`
    end
  end
end
