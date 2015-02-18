#!/usr/bin/env ruby
# Builds installfest script from Manifest files.
# TODO(phlco) allow arguments?
# build = ARGV[0]

Dir["manifests/Manifest*"].each do |manifest|
p manifest
  filename = manifest.gsub(/manifest./i, '')
  File.open("#{ENV['PWD']}/builds#{filename}", 'w') do |file|
    File.read(manifest).each_line do |line|
      unless line.start_with?("#") || line.strip == ""
        file_path = (line =~ /^tests\// ? "#{line.chomp}.sh" : "scripts/#{line.chomp}.sh")
        file << File.read(file_path)
        file << "\n"
      else
        file << "\n\n#{line.gsub('# ->', '').strip}\n\n" if line.start_with?('# ->')
      end
    end
  end
end
