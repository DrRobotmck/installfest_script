task :default => 'installer:build'

namespace :installer do

  desc "Build installscirpts from manifest files"
  task :build do
    system("./bin/build.rb")
    puts "Build installs from manifests"
  end

end
