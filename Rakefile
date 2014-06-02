task :default => 'build:mac'

namespace :build do

  desc "Mac installscript"
  task :mac do
    puts 'build mac tasks'
    system("./bin/build.rb mac")
  end

  desc "Linux installscript"
  task :linux do
    puts 'build linux tasks'
    system("./bin/build.rb linux")
  end

end
