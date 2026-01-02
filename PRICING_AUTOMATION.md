# App Store Pricing and Availability Automation

This setup automates App Store pricing and availability configuration using Fastlane, GitHub Actions, and AWS Lambda.

## 🎯 Features

- **Pricing**: Set app to $0.00 (free) for all countries/regions
- **Availability**: Enable app for all countries/regions  
- **Base Country**: United States (USD)
- **Automation**: Trigger via Lambda → GitHub Actions → Fastlane

## 📋 Requirements Met

✅ **Pricing Configuration**
- Base Country: United States (USD)
- Price: $0.00 (free)
- Applied to all countries/regions
- No paid tiers

✅ **Availability Configuration**  
- Enabled for all countries/regions
- No geographic restrictions

✅ **API Integration**
- App Store Connect API key authentication
- Key ID: 762ZATSHW9
- Issuer ID: 69a6de92-4f8b-47e3-e053-5b8c7c11a4d1
- Private key: AuthKey_762ZATSHW9.p8

## 🚀 Usage

### 1. Lambda Trigger (Recommended)

```bash
# Via AWS CLI
aws lambda invoke \
  --function-name GithubAction-live-pricing \
  --payload '{"bundle_id":"com.san.mainAp"}' \
  response.json

# Via HTTP endpoint
curl -X POST https://64s34grwb8.execute-api.eu-central-1.amazonaws.com/live/pricing \
  -H "Content-Type: application/json" \
  -d '{"bundle_id":"com.san.mainAp"}'
```

### 2. Direct GitHub Actions

```bash
# Trigger workflow manually
gh workflow run pricing-only.yml -f bundle_id="com.san.mainAp"
```

### 3. Local Fastlane

```bash
# Run locally
bundle exec fastlane update_pricing_and_availability bundle_id:"com.san.mainAp"

# Or use the Ruby script directly
ruby configure_pricing.rb com.san.mainAp
```

## 🔧 Configuration Files

### Fastlane (`fastlane/Fastfile`)
- `update_pricing_and_availability` lane
- API key authentication
- Fallback error handling

### GitHub Workflow (`.github/workflows/pricing-only.yml`)
- Triggered by Lambda or manual dispatch
- Uses App Store Connect API keys
- Supports bundle_id parameter

### Lambda Handler (`pricing-handler.js`)
- Triggers GitHub workflow
- Accepts bundle_id parameter
- Returns status and confirmation

### Ruby Script (`configure_pricing.rb`)
- Direct Spaceship API integration
- Comprehensive pricing/availability setup
- Detailed logging and error handling

## 🔐 Required Secrets

Set these in GitHub repository secrets:

```
APP_STORE_CONNECT_API_KEY_KEY_ID=762ZATSHW9
APP_STORE_CONNECT_API_KEY_ISSUER_ID=69a6de92-4f8b-47e3-e053-5b8c7c11a4d1
APP_STORE_CONNECT_API_KEY_KEY=<base64-encoded-p8-key-content>
```

## 📊 Workflow

```
Lambda Trigger → GitHub Actions → Fastlane → App Store Connect
     ↓              ↓              ↓              ↓
  HTTP/Event    Workflow Run   Ruby Script    API Calls
```

## 🧪 Testing

```bash
# Test Lambda locally
./test_pricing_trigger.sh

# Test Fastlane locally  
bundle exec fastlane update_pricing_and_availability

# Test Ruby script directly
ruby configure_pricing.rb com.san.mainAp
```

## 📝 Logs & Monitoring

- **GitHub Actions**: Check workflow runs for detailed logs
- **Lambda**: CloudWatch logs for trigger events
- **Fastlane**: Console output with step-by-step progress

## 🔄 Deployment

```bash
# Deploy Lambda functions
./deploy.sh

# Update GitHub repository
git add . && git commit -m "update" && git push
```

## 🎯 Expected Results

After successful execution:

1. **App Store Connect → Monetization → Pricing and Availability**
   - Price Schedule: $0.00 for all countries/regions
   - Base Country: United States (USD)

2. **App Store Connect → App Availability**  
   - All Countries/Regions: ✅ Enabled

3. **Confirmation**
   - GitHub Actions: ✅ Workflow completed
   - Lambda: ✅ Response with success status
   - Fastlane: ✅ Console logs with checkmarks

## 🆘 Troubleshooting

- **Authentication Issues**: Verify API key secrets in GitHub
- **App Not Found**: Check bundle_id parameter
- **Workflow Fails**: Check GitHub Actions logs
- **Lambda Timeout**: Increase timeout in serverless.yml

## 📞 Support

- GitHub Repository: https://github.com/bariamanoj/ios-builder
- Lambda Endpoint: https://64s34grwb8.execute-api.eu-central-1.amazonaws.com/live/pricing
