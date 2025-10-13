const { handler } = require('./handler');

// Test the Lambda function locally
async function test() {
  console.log('🧪 Testing Lambda function locally...');
  
  const testEvent = {
    repo_url: "bariamanoj/NewAppSample",
    app_name: "NewAppSample", 
    bundle_identifier: "com.san.mainApp"
  };
  
  try {
    const result = await handler(testEvent);
    console.log('✅ Result:', JSON.parse(result.body));
  } catch (error) {
    console.log('❌ Error:', error.message);
  }
}

test();
