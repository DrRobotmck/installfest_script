#!/usr/bin/env ruby
# Builds installfest script from Manifest files.
# TODO(phlco) allow arguments?
# build = ARGV[0]

Dir["Manifest*"].each do |manifest|
  filename = manifest.gsub(/manifest./i, '')
  File.open(filename, 'w') do |file|
    File.read(manifest).each_line do |line|
      unless line.start_with?("#") || line.strip == ""
        file_path = (line =~ /^tests\// ? "#{line.chomp}.sh" : "lib/#{line.chomp}.sh")
        file << File.read(file_path)
        file << "\n"
      else
        if line.start_with?('# ->')
          file << "\n\n#{line.gsub('# ->', '').strip}\n\n"
        end
      end
    end
  end
end
