# iOS Builder Lambda Function

This Lambda function triggers a GitHub Actions workflow to build iOS apps, create archives, and upload them to the App Store.

## Features

- ✅ Accepts source code repository URL
- ✅ Configurable app name and bundle identifier
- ✅ Creates new app in App Store Connect
- ✅ Generates iOS archive (.xcarchive)
- ✅ Uploads to App Store automatically
- ✅ Handles certificates and provisioning profiles via Fastlane Match

## Setup

### 1. Deploy Lambda Function

```bash
cd "/Users/manzz/Mobibox/Lambda/ios fastlane/GithubAction"
./deploy.sh
```

### 2. Required GitHub Secrets

Set these secrets in your `ios-builder` repository:

- `GH_TOKEN`: GitHub personal access token
- `APP_STORE_CONNECT_API_KEY_KEY_ID`: 762ZATSHW9
- `APP_STORE_CONNECT_API_KEY_ISSUER_ID`: b0a700be-f8fa-481c-bb07-9992a2e2052d
- `APP_STORE_CONNECT_API_KEY_KEY`: (Your App Store Connect API key content)
- `DEVELOPER_TEAM_ID`: 42FLQUC3A9
- `MATCH_PASSWORD`: Password for certificate repository
- `MATCH_GIT_URL`: https://github.com/bariamanoj/ios-certificates

## Usage

### Lambda Function Parameters

```json
{
  "repo_url": "bariamanoj/ManzzContactApp",
  "app_name": "New Contact",
  "bundle_identifier": "com.manzz.contactapp"
}
```

### Test Locally

```bash
serverless invoke -f api --data '{"repo_url":"bariamanoj/ManzzContactApp","app_name":"New Contact","bundle_identifier":"com.manzz.contactapp"}'
```

### API Gateway Endpoint

After deployment, you'll get an API Gateway endpoint. Send POST requests with the JSON payload above.

## Workflow Process

1. **Lambda Trigger**: Receives repo URL, app name, and bundle ID
2. **GitHub Actions**: Triggers workflow in ios-builder repository
3. **Source Checkout**: Downloads source code from specified repository
4. **App Store Setup**: Creates new app in App Store Connect
5. **Certificate Management**: Downloads certificates via Fastlane Match
6. **Build & Archive**: Creates iOS archive (.xcarchive)
7. **Upload**: Uploads IPA to App Store Connect
8. **Artifacts**: Saves build artifacts for download

## File Structure

```
GithubAction/
├── index.js          # Lambda function code
├── serverless.yml     # AWS deployment configuration
├── package.json       # Node.js dependencies
├── event.json         # Test event data
├── deploy.sh          # Deployment script
└── README.md          # This file
```

## Environment Variables

- `GITHUB_TOKEN`: GitHub access token
- `GITHUB_OWNER`: bariamanoj
- `GITHUB_REPO`: ios-builder

## Troubleshooting

1. **Build Fails**: Check GitHub Actions logs in ios-builder repository
2. **Certificate Issues**: Verify MATCH_PASSWORD and certificate repository access
3. **App Store Issues**: Ensure API key has proper permissions
4. **Lambda Timeout**: Increase timeout in serverless.yml if needed
