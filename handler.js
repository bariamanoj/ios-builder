const axios = require("axios");

const GITHUB_TOKEN = process.env.GH_TOKEN || "process.env.GH_TOKEN";
const GITHUB_OWNER = "bariamanoj";
const GITHUB_REPO = "ios-builder";

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
    
    console.log(`Triggering build for: ${app_name} (${bundle_identifier})`);
    
    const response = await axios.post(
      `https://api.github.com/repos/${GITHUB_OWNER}/${GITHUB_REPO}/actions/workflows/ios-build-deploy.yml/dispatches`,
      {
        ref: "main",
        inputs: {
          repo_url: repo_url,
          app_name: app_name,
          bundle_identifier: bundle_identifier
        }
      },
      {
        headers: {
          Authorization: `Bearer ${GITHUB_TOKEN}`,
          Accept: "application/vnd.github.v3+json",
          "Content-Type": "application/json"
        }
      }
    );

    return {
      statusCode: 200,
      body: JSON.stringify({
        message: "iOS build workflow triggered successfully",
        app_name,
        bundle_identifier
      })
    };

  } catch (error) {
    console.error("Error:", error.response?.data || error.message);
    
    return {
      statusCode: 500,
      body: JSON.stringify({
        error: "Failed to trigger workflow",
        details: error.response?.data || error.message
      })
    };
  }
};
