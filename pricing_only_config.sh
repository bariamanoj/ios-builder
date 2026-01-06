#!/bin/bash

echo "💰 Running ONLY Pricing and Availability Configuration..."
echo "📱 App: ManzTestApp2025"
echo "🆔 Bundle: com.san.mainAp"

cd "/Users/manzz/Mobibox/Lambda/ios fastlane/ios-builder"

# Set environment variables
export FASTLANE_SKIP_2FA_UPGRADE=1
export FASTLANE_HIDE_CHANGELOG=1
export APP_STORE_CONNECT_API_KEY_KEY_ID="762ZATSHW9"
export APP_STORE_CONNECT_API_KEY_ISSUER_ID="69a6de92-0f0b-47fc-a463-0b4e4b9f8a2a"

# Run only pricing configuration
echo "🚀 Configuring pricing and availability..."
bundle exec fastlane configure_pricing_and_availability bundle_id:"com.san.mainAp"

echo "✅ Pricing configuration completed!"
