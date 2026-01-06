default_platform(:ios)

platform :ios do
  desc "Update app pricing using direct API with correct appPricePoint ID"
  lane :update_pricing do
    require 'net/http'
    require 'json'
    require 'jwt'
    require 'openssl'

    # App Store Connect API credentials
    key_id = ENV['APP_STORE_CONNECT_API_KEY_ID']
    issuer_id = ENV['APP_STORE_CONNECT_ISSUER_ID']
    private_key_content = ENV['APP_STORE_CONNECT_API_PRIVATE_KEY']
    
    app_id = "6753968771"
    
    # Generate JWT token
    private_key = OpenSSL::PKey::EC.new(private_key_content)
    
    payload = {
      iss: issuer_id,
      exp: Time.now.to_i + 1200,
      aud: "appstoreconnect-v1",
      iat: Time.now.to_i
    }
    
    headers = {
      kid: key_id,
      typ: "JWT"
    }
    
    token = JWT.encode(payload, private_key, 'ES256', headers)
    
    # Create pricing schedule payload with correct appPricePoint ID from apis.txt
    pricing_payload = {
      data: {
        type: "appPriceSchedules",
        attributes: {
          baseTerritory: "USA"
        },
        relationships: {
          app: {
            data: {
              type: "apps",
              id: app_id
            }
          },
          manualPrices: {
            data: [
              {
                type: "appPriceScheduleManualPrices",
                id: "${local-price-1}",
                attributes: {
                  startDate: nil,
                  endDate: nil
                },
                relationships: {
                  territory: {
                    data: {
                      type: "territories",
                      id: "USA"
                    }
                  },
                  appPricePoint: {
                    data: {
                      type: "appPricePoints",
                      id: "eyJzIjoiNjc1Mzk2ODc3MSIsInQiOiJVU0EiLCJwIjoiMTAwMTAifQ"
                    }
                  }
                }
              }
            ]
          }
        }
      }
    }
    
    # Make API request
    uri = URI('https://api.appstoreconnect.apple.com/v1/appPriceSchedules')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    
    request = Net::HTTP::Post.new(uri)
    request['Authorization'] = "Bearer #{token}"
    request['Content-Type'] = 'application/json'
    request.body = pricing_payload.to_json
    
    response = http.request(request)
    
    puts "Response code: #{response.code}"
    puts "Response body: #{response.body}"
    
    if response.code == '201'
      UI.success("✅ Successfully updated app pricing to $0.99")
    else
      UI.error("❌ Failed to update pricing: #{response.body}")
      raise "Pricing update failed"
    end
  end

  desc "Build and upload to App Store"
  lane :release do
    # Increment build number
    increment_build_number(xcodeproj: "YourApp.xcodeproj")
    
    # Build the app
    build_app(
      scheme: "YourApp",
      export_method: "app-store",
      export_options: {
        provisioningProfiles: {
          ENV["IOS_BUNDLE_ID"] => "YourApp AppStore"
        }
      }
    )
    
    # Upload to App Store Connect
    upload_to_app_store(
      skip_metadata: false,
      skip_screenshots: true,
      submit_for_review: false,
      automatic_release: false
    )
  end
  
  desc "Build for testing"
  lane :beta do
    build_app(
      scheme: "YourApp",
      export_method: "ad-hoc"
    )
    
    # Upload to TestFlight
    upload_to_testflight(
      skip_waiting_for_build_processing: true
    )
  end
end
