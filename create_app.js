import fs from "fs";
import jwt from "jsonwebtoken";
import axios from "axios";

// ==== Your App Store Connect API Credentials ====
const ISSUER_ID = "b0a700be-f8fa-481c-bb07-9992a2e2052d";
const KEY_ID = "762ZATSHW9";
const PRIVATE_KEY_PATH = "./AuthKey_762ZATSHW9.p8";

// ==== App Details ====
const APP_NAME = "Manzz123App";
const PRIMARY_LOCALE = "en-US";
const BUNDLE_ID = "com.mapm.mazzapp";
const SKU = "FINALTEST001";
const PLATFORM = "IOS"; // iOS app

// === Generate JWT Token ===
function generateToken() {
  const privateKey = fs.readFileSync(PRIVATE_KEY_PATH, "utf8");
  const now = Math.floor(Date.now() / 1000);

  const payload = {
    iss: ISSUER_ID,
    exp: now + 1200, // valid for 20 minutes
    aud: "appstoreconnect-v1",
  };

  const token = jwt.sign(payload, privateKey, {
    algorithm: "ES256",
    header: {
      alg: "ES256",
      kid: KEY_ID,
      typ: "JWT",
    },
  });

  return token;
}

// === Create App on App Store Connect ===
async function createApp() {
  const token = generateToken();
  console.log("✅ JWT token generated");

  // Optional: verify JWT structure
  const decoded = jwt.decode(token, { complete: true });
  console.log("Decoded JWT header:", decoded.header);
  console.log("Decoded JWT payload:", decoded.payload);

  const headers = {
    Authorization: `Bearer ${token}`,
    "Content-Type": "application/json",
  };

  const body = {
    data: {
      type: "apps",
      attributes: {
        bundleId: BUNDLE_ID,
        name: APP_NAME,
        primaryLocale: PRIMARY_LOCALE,
        sku: SKU,
        platform: PLATFORM,
      },
    },
  };

  try {
    const response = await axios.post(
      "https://api.appstoreconnect.apple.com/v1/apps",
      body,
      { headers }
    );
    console.log("🎉 App created successfully!");
    console.log(JSON.stringify(response.data, null, 2));
  } catch (error) {
    if (error.response) {
      console.error("❌ API Error:", error.response.status, error.response.data);
    } else {
      console.error("❌ Error:", error.message);
    }
  }
}

createApp();
