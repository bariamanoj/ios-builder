// Test handler that simulates successful workflow trigger
exports.handler = async (event) => {
  try {
    let params;
    if (typeof event === 'string') {
      params = JSON.parse(event);
    } else if (event.body) {
      params = JSON.parse(event.body);
    } else {
      params = event;
    }
    
    const { repo_url, app_name, bundle_identifier } = params;
    
    console.log(`Simulating build trigger for: ${app_name} (${bundle_identifier})`);
    console.log(`Repository: ${repo_url}`);
    console.log(`Workflow would be triggered with fresh session token`);
    
    // Simulate successful response
    return {
      statusCode: 200,
      body: JSON.stringify({
        message: "iOS build workflow would be triggered successfully",
        app_name,
        bundle_identifier,
        repo_url,
        note: "Manual trigger required due to GitHub token permissions"
      })
    };

  } catch (error) {
    console.error("Error:", error.message);
    
    return {
      statusCode: 500,
      body: JSON.stringify({
        error: "Failed to process request",
        details: error.message
      })
    };
  }
};
