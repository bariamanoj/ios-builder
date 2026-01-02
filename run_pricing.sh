#!/bin/bash

echo "🏪 Running Pricing and Availability Update..."

cd "/Users/manzz/Mobibox/Lambda/ios fastlane/ios-builder"

# Use the session token from environment
export FASTLANE_SESSION="${FASTLANE_SESSION}"
export FASTLANE_PASSWORD="Sanket_4392"
export FASTLANE_SKIP_2FA_UPGRADE=1
export FASTLANE_HIDE_CHANGELOG=1

# Run just the pricing lane
fastlane update_pricing_and_availability
