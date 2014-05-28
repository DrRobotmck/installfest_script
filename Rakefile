task :default => 'build:all'

namespace :build do

  desc "Mac installscript"
  task :mac do
    puts 'build mac tasks'
  end

  desc "Linux installscript"
  task :linux do
    puts 'build linux tasks'
  end

  desc "Custom installscript"
  task :interactive do
    puts 'build script interactively'
  end

  desc "build all versions of scripts"
  task :all do
    puts 'doing all tasks'
    system("./bin/build.rb")
  end

end
