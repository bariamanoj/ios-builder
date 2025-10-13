#!/bin/bash

# Script to trigger iOS build workflow
# Usage: ./trigger_build.sh [GITHUB_TOKEN]

GITHUB_TOKEN=${1:-$GITHUB_TOKEN}

if [ -z "$GITHUB_TOKEN" ]; then
    echo "❌ GitHub token required"
    echo "Usage: ./trigger_build.sh YOUR_GITHUB_TOKEN"
    echo "Or set GITHUB_TOKEN environment variable"
    exit 1
fi

echo "🚀 Triggering iOS build workflow..."

curl -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $GITHUB_TOKEN" \
  https://api.github.com/repos/bariamanoj/ios-builder/actions/workflows/ios-build-deploy.yml/dispatches \
  -d '{
    "ref": "main",
    "inputs": {
      "repo_url": "bariamanoj/NewAppSample",
      "app_name": "NewAppSample", 
      "bundle_identifier": "com.san.mainApp"
    }
  }'

echo ""
echo "✅ Workflow triggered! Check: https://github.com/bariamanoj/ios-builder/actions"
