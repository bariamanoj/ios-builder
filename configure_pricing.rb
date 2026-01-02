#!/usr/bin/env ruby

require 'spaceship'

# Configuration
BUNDLE_ID = ARGV[0] || "com.san.mainAp"
KEY_ID = ENV["APP_STORE_CONNECT_API_KEY_KEY_ID"] || "762ZATSHW9"
ISSUER_ID = ENV["APP_STORE_CONNECT_API_KEY_ISSUER_ID"] || "69a6de92-4f8b-47e3-e053-5b8c7c11a4d1"
KEY_FILE = "./AuthKey_762ZATSHW9.p8"

puts "🚀 Configuring App Store pricing and availability"
puts "📱 Bundle ID: #{BUNDLE_ID}"

begin
  # Authenticate with App Store Connect API
  Spaceship::ConnectAPI.token = Spaceship::ConnectAPI::Token.create(
    key_id: KEY_ID,
    issuer_id: ISSUER_ID,
    filepath: KEY_FILE
  )
  
  puts "✅ Authenticated with App Store Connect API"
  
  # Find the app
  app = Spaceship::ConnectAPI::App.find(BUNDLE_ID)
  
  if app.nil?
    puts "❌ App not found with bundle ID: #{BUNDLE_ID}"
    exit 1
  end
  
  puts "📱 Found app: #{app.name}"
  
  # Get all available territories
  territories = Spaceship::ConnectAPI::Territory.all
  puts "🌍 Found #{territories.count} territories"
  
  # Configure pricing - Set to free ($0.00) for all territories
  puts "💰 Setting price to $0.00 (Free) for all territories..."
  
  # Get current app price schedule
  app_price_schedules = app.get_app_price_schedules
  
  if app_price_schedules.empty?
    puts "📝 Creating new price schedule..."
    
    # Create new price schedule for free app
    price_schedule = Spaceship::ConnectAPI::AppPriceSchedule.create(
      app: app,
      base_territory: "US",
      manual_prices: []  # Empty means free for all territories
    )
    
    puts "✅ Created price schedule with $0.00 for all territories"
  else
    puts "📝 Updating existing price schedule..."
    
    price_schedule = app_price_schedules.first
    
    # Update to free pricing
    price_schedule.update(
      attributes: {
        baseTerritory: "US"
      },
      relationships: {
        manualPrices: {
          data: []  # Empty array = free for all territories
        }
      }
    )
    
    puts "✅ Updated price schedule to $0.00 for all territories"
  end
  
  # Configure availability - Enable for all countries/regions
  puts "🌍 Enabling availability for all countries/regions..."
  
  app_availabilities = app.get_app_availabilities
  
  if app_availabilities.empty?
    puts "📝 Creating new availability configuration..."
    
    # Create availability for all territories
    availability = Spaceship::ConnectAPI::AppAvailability.create(
      app: app,
      available_territories: territories
    )
    
    puts "✅ Created availability for all #{territories.count} territories"
  else
    puts "📝 Updating existing availability configuration..."
    
    availability = app_availabilities.first
    
    # Update to include all territories
    availability.update(
      relationships: {
        availableTerritories: {
          data: territories.map { |territory| 
            { type: "territories", id: territory.id } 
          }
        }
      }
    )
    
    puts "✅ Updated availability for all #{territories.count} territories"
  end
  
  puts ""
  puts "🎉 Successfully configured:"
  puts "   💰 Pricing: $0.00 (Free) for all countries/regions"
  puts "   🌍 Availability: All countries/regions enabled"
  puts "   📍 Base Country: United States (USD)"
  puts ""
  puts "✅ App Store pricing and availability configuration completed!"
  
rescue => e
  puts "❌ Error: #{e.message}"
  puts e.backtrace if ENV["DEBUG"]
  exit 1
end
