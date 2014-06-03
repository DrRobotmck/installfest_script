#!/usr/bin/env ruby
# Builds installfest script from Manfiest files.
# TODO(phlco) allow arguments?
# build = ARGV[0]

Dir["Manifest*"].each do |manifest|
  filename = manifest.gsub(/manifest./i, '')
  File.open(filename, 'w') do |file|
    File.read(manifest).each_line do |line|
      file << File.read("lib/#{line.chomp}") unless line.start_with? "#"
    end
  end
end
