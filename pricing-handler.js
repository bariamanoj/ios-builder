const axios = require("axios");

const GITHUB_TOKEN = process.env.GH_TOKEN || "your-github-token-here";
const GITHUB_OWNER = "bariamanoj";
const GITHUB_REPO = "ios-builder";

exports.handler = async (event) => {
  try {
    console.log("Triggering pricing workflow...");
    
    const response = await axios.post(
      `https://api.github.com/repos/${GITHUB_OWNER}/${GITHUB_REPO}/actions/workflows/pricing-only.yml/dispatches`,
      {
        ref: "main"
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
        message: "Pricing workflow triggered successfully",
        workflow: "pricing-only.yml"
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
