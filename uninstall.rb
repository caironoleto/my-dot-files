#!/usr/bin/env ruby

home = File.expand_path('~')

Dir['*'].each do |file|
  next if file =~ /install/

  target = File.join(home, ".#{file}")
  `unlink #{target}`
end
