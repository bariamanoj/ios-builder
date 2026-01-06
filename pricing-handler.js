import axios from "axios";

const GITHUB_TOKEN = process.env.GITHUB_TOKEN;
const GITHUB_OWNER = "bariamanoj";
const GITHUB_REPO = "ios-builder";

export const pricingHandler = async (event) => {
  try {
    let params;
    if (typeof event === 'string') {
      params = JSON.parse(event);
    } else if (event.body) {
      params = JSON.parse(event.body);
    } else {
      params = event;
    }
    
    const { bundle_identifier } = params;
    
    console.log(`Triggering pricing configuration for: ${bundle_identifier}`);
    
    // Trigger pricing-only workflow
    const response = await axios.post(
      `https://api.github.com/repos/${GITHUB_OWNER}/${GITHUB_REPO}/actions/workflows/pricing-only.yml/dispatches`,
      {
        ref: "main",
        inputs: {
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
        message: "Pricing configuration workflow triggered successfully",
        bundle_identifier
      })
    };

  } catch (error) {
    console.error("Error:", error.response?.data || error.message);
    
    return {
      statusCode: 500,
      body: JSON.stringify({
        error: "Failed to trigger pricing workflow",
        details: error.response?.data || error.message
      })
    };
  }
};
