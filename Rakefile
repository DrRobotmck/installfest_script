task :default => ['installer:create_branch_file','installer:build']

namespace :installer do
  desc "Build the script branch shell file dynamically"
  task :create_branch_file do
    File.open("lib/set_script_branch.sh", "w+") do |f|
      f << "\n# This refers to the branch of our repo that we are using (for cloning)." +
           "\nBRANCH=#{`git rev-parse --abbrev-ref HEAD`}"
    end
  end

  desc "Build installscirpts from manifest files"
  task :build do
    system("./bin/build.rb")
    puts "Build installs from manifests"
  end

end
