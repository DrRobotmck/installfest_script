#!/usr/bin/env ruby
# Builds installfest script from Manfiest files.
# TODO(phlco) allow arguments?
# build = ARGV[0]

Dir["Manifest*"].each do |manifest|
  filename = manifest.gsub(/manifest./i, '')
  File.open(filename, 'w') do |file|
    File.read(manifest).each_line do |line|
      unless line.start_with?("#") || line.strip == ""
        file << File.read("lib/#{line.chomp}.sh")
      end
    end
  end
end
