#!/usr/bin/env ruby
require 'webrick'
 
if ARGV.size < 3
    puts "usage: #{$0} password-file user password"
      exit 1
end
 
# create htpassword instance
passwordfile = ARGV.shift
passwd = WEBrick::HTTPAuth::Htpasswd.new(passwordfile)
 
# register password
user = ARGV.shift
password = ARGV.shift
passwd.set_passwd(nil, user, password)
passwd.flush # save
puts IO.read(passwordfile)
 
# get crypted password
enc_pass = passwd.get_passwd(nil, user, false)
puts enc_pass
