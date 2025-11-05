const { handler } = require('./handler');
const fs = require('fs');

// Set GitHub token from environment variable
// Usage: GH_TOKEN=your_token_here node test_local.js
if (!process.env.GH_TOKEN) {
  console.error('❌ Please set GH_TOKEN environment variable');
  process.exit(1);
}

console.log('🔑 GitHub Token:', process.env.GH_TOKEN.substring(0, 10) + '...');

// Read event data
const event = JSON.parse(fs.readFileSync('./event.json', 'utf8'));

console.log('🚀 Testing Lambda function locally...');
console.log('📋 Event data:', JSON.stringify(event, null, 2));

handler(event)
  .then(result => {
    console.log('✅ Success:', result);
  })
  .catch(error => {
    console.error('❌ Error:', error);
  });
