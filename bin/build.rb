Dir["Manifest*"].each do |manifest|
  filename = manifest.gsub(/manifest./i, '')
  File.open(filename, 'w') do |file|
    File.read(manifest).each_line do |line|
      file << File.read("lib/#{line.chomp}") unless line.start_with? "#"
    end
  end
end
