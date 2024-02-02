#!/usr/bin/env ruby

home = File.expand_path('~')

Dir['**/*'].each do |file|
  next if file =~ /install/
  next if File.directory? file

  target = File.join(home, ".#{file}")
  `ln -nfs #{File.expand_path file} #{target}`
end
