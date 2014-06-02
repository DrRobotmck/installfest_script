#!/usr/bin/env ruby
# Builds installfest script from Manfiest files.
build = ARGV[0]

manifests = Dir["Manifest*"].select { |f| f.include? build }

manifests.each do |manifest|
  filename = manifest.gsub(/manifest./i, '')
  File.open(filename, 'w') do |file|
    File.read(manifest).each_line do |line|
      file << File.read("lib/#{line.chomp}") unless line.start_with? "#"
    end
  end
end
