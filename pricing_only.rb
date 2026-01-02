#!/usr/bin/env ruby

require 'fastlane'

# Set up Fastlane session
ENV['FASTLANE_SESSION'] = ARGV[0] if ARGV[0]
ENV['FASTLANE_PASSWORD'] = 'Sanket_4392'
ENV['FASTLANE_SKIP_2FA_UPGRADE'] = '1'
ENV['FASTLANE_HIDE_CHANGELOG'] = '1'

# Bundle ID for the app
BUNDLE_ID = 'com.san.mainAp'

puts "🏪 Starting Pricing and Availability Update"
puts "📱 App Bundle ID: #{BUNDLE_ID}"

begin
  require 'spaceship'
  
  # Login using session token
  Spaceship::Tunes.login
  
  # Find the app
  app = Spaceship::Tunes.select_app!(app_identifier: BUNDLE_ID)
  puts "✅ Found app: #{app.name} (ID: #{app.apple_id})"
  
  # Set price to free (tier 0)
  puts "💰 Setting price to FREE..."
  app.update_price_tier!(0)
  puts "✅ Price updated to FREE ($0.00)"
  
  # Set availability to all countries/regions
  puts "🌍 Setting availability to ALL countries/regions..."
  all_territories = Spaceship::Tunes::Territory.all
  app.availability.update!(territories: all_territories.map { |t| t.code })
  puts "✅ Availability updated to all countries/regions"
  
  puts ""
  puts "🎉 SUCCESS! Pricing and Availability updated:"
  puts "   💰 Price: FREE ($0.00)"
  puts "   🌍 Availability: All countries/regions"
  
rescue => e
  puts "❌ ERROR: #{e.message}"
  exit 1
end
