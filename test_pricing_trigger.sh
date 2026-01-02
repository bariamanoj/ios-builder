#!/bin/bash

echo "🚀 Testing Lambda pricing trigger..."

# Test the Lambda function locally
node -e "
const handler = require('./pricing-handler.js');

const testEvent = {
  bundle_id: 'com.san.mainAp'
};

handler.handler(testEvent).then(result => {
  console.log('✅ Lambda Response:');
  console.log(JSON.stringify(result, null, 2));
}).catch(error => {
  console.error('❌ Lambda Error:', error);
});
"

echo ""
echo "📝 To trigger via AWS Lambda:"
echo "aws lambda invoke --function-name ios-pricing-automation --payload '{\"bundle_id\":\"com.san.mainAp\"}' response.json"
