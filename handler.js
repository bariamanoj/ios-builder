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
    
    const { 
      repo_url, 
      app_name, 
      bundle_identifier,
      contact_first_name,
      contact_last_name,
      contact_phone,
      contact_email,
      app_description,
      marketing_url,
      privacy_policy_url,
      support_url
    } = params;
    
    console.log(`Triggering build for: ${app_name} (${bundle_identifier})`);
    console.log(`Contact: ${contact_first_name} ${contact_last_name} - ${contact_email}`);
    
    const response = await axios.post(
      `https://api.github.com/repos/${GITHUB_OWNER}/${GITHUB_REPO}/actions/workflows/ios-build-deploy.yml/dispatches`,
      {
        ref: "main",
        inputs: {
          repo_url: repo_url,
          app_name: app_name,
          bundle_identifier: bundle_identifier,
          contact_first_name: contact_first_name || "SANKETKUMAR",
          contact_last_name: contact_last_name || "DOHRA",
          contact_phone: contact_phone || "+91 9265171259",
          contact_email: contact_email || "dohrasanket@gmail.com",
          app_description: app_description || "This ManzzPlusApp app is just simple, sample demo app where you can get lots of details and guide and tips, This app spedically design for you, so why are you waiting just download and enjoy it.",
          support_url: support_url || marketing_url || "https://dohrasanket.pages.dev/",
          privacy_policy_url: privacy_policy_url || "https://dohrasanket.pages.dev/PrivacyPolicy"
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
        bundle_identifier,
        contact: `${contact_first_name} ${contact_last_name}`
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
