#!/bin/bash

echo "🚀 Deploying iOS Builder Lambda Function..."

# Check if serverless is installed
if ! command -v serverless &> /dev/null; then
    echo "❌ Serverless framework not found. Installing..."
    npm install -g serverless
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Deploy the function
echo "🔧 Deploying to AWS..."
serverless deploy

echo "✅ Deployment completed!"
echo ""
echo "📋 Test the function with:"
echo "serverless invoke -f api --data '{\"repo_url\":\"bariamanoj/ManzzContactApp\",\"app_name\":\"New Contact\",\"bundle_identifier\":\"com.manzz.contactapp\"}'"
