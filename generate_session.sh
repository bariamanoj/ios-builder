#!/bin/bash

echo "🔐 Fastlane Session Token Generator"
echo "=================================="
echo ""
echo "This will generate a FASTLANE_SESSION token for your GitHub repository."
echo ""
echo "Steps to generate the token:"
echo ""
echo "1. Run this command in your terminal:"
echo "   export FASTLANE_PASSWORD='Sanket_4392'"
echo ""
echo "2. Then run:"
echo "   fastlane spaceauth -u dohrasanket@gmail.com"
echo ""
echo "3. Follow the prompts:"
echo "   - It will ask for 2FA code if enabled"
echo "   - It will generate a session token"
echo ""
echo "4. Copy the generated token and add it to GitHub Secrets:"
echo "   - Go to your GitHub repository"
echo "   - Settings > Secrets and variables > Actions"
echo "   - Add new secret:"
echo "     Name: FASTLANE_SESSION"
echo "     Value: [paste the token]"
echo ""
echo "5. The token expires after ~30 days"
echo ""
echo "Ready to generate? Press Enter to continue..."
read

echo "Setting password environment variable..."
export FASTLANE_PASSWORD='Sanket_4392'

echo "Running fastlane spaceauth..."
fastlane spaceauth -u dohrasanket@gmail.com

echo ""
echo "✅ If successful, copy the token above and add it to GitHub Secrets as FASTLANE_SESSION"
