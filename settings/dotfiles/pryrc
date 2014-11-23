# awesome print
begin
  require "awesome_print"
  AwesomePrint.pry!
rescue LoadError => e
  puts "ap gem not found."
  if ( ENV['RAILS_ENV'] || defined? Rails )
    puts "Try adding awesome_print to your Gemfile"
  else
    puts "Try typing 'gem install awesome_print' to get super-fancy output."
  end
end

# Colors
red    = "\e[0;31m"
reset  = "\e[0m"
yellow = "\e[0;33m"

# set a nice prompt for rails
if ( ENV['RAILS_ENV'] || defined? Rails )
  begin
    rails_root = File.basename(Dir.pwd)
    Pry.config.prompt_name = "#{red}#{rails_root}#{reset}"
  rescue Exception
    warn "Could not load"
  end
else
  Pry.config.prompt_name = "#{red}Pry#{reset}"
end
