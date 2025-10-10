default_platform(:ios)

platform :ios do
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
