#!/usr/bin/env ruby

require 'spaceship'

puts "Generating new Fastlane session token..."
puts "Please enter your Apple ID credentials:"

print "Apple ID: "
username = gets.chomp

print "Password: "
password = gets.chomp

begin
  Spaceship::Tunes.login(username, password)
  session_token = Spaceship::Tunes.client.store_cookie
  
  puts "\n" + "="*50
  puts "NEW FASTLANE SESSION TOKEN:"
  puts "="*50
  puts session_token
  puts "="*50
  puts "\nAdd this to your GitHub repository secrets as FASTLANE_SESSION"
  
rescue => e
  puts "Error: #{e.message}"
  puts "Make sure you have 2FA enabled and use an app-specific password"
end
