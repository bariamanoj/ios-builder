const { handler } = require('./handler');
const fs = require('fs');

// Test the Lambda function locally
async function test() {
  console.log('🧪 Testing Lambda function locally...');
  
  // Read test event from event.json
  const testEvent = JSON.parse(fs.readFileSync('./event.json', 'utf8'));
  
  try {
    const result = await handler(testEvent);
    console.log('✅ Result:', JSON.parse(result.body));
  } catch (error) {
    console.log('❌ Error:', error.message);
  }
}

test();
