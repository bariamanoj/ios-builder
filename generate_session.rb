#!/usr/bin/env ruby

puts "🔐 Generating Fastlane Session Token..."
puts "This will use fastlane spaceauth to generate the session token"
puts "\nRun the following command and follow the prompts:"
puts "\nfastlane spaceauth -u dohrasanket@gmail.com"
puts "\nAfter running the command above, it will:"
puts "1. Ask for your Apple ID password"
puts "2. Handle 2FA if enabled"
puts "3. Generate a session token"
puts "4. Display the token to copy"
puts "\nThen add the token to GitHub Secrets as FASTLANE_SESSION"
