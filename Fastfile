default_platform(:ios)

platform :ios do
  desc "Build and archive iOS app"
  lane :build_archive do |options|
    app_name = options[:app_name] || "MyApp"
    bundle_id = options[:bundle_id] || "com.example.app"
    
    # Find project/workspace
    if Dir.glob("*.xcworkspace").any?
      workspace = Dir.glob("*.xcworkspace").first
      scheme = File.basename(workspace, ".xcworkspace")
      
      build_app(
        workspace: workspace,
        scheme: scheme,
        configuration: "Release",
        export_method: "development",
        skip_codesigning: true,
        archive_path: "./build/#{scheme}.xcarchive",
        output_directory: "./build/ipa",
        output_name: "#{app_name}.ipa"
      )
    elsif Dir.glob("*.xcodeproj").any?
      project = Dir.glob("*.xcodeproj").first
      scheme = File.basename(project, ".xcodeproj")
      
      build_app(
        project: project,
        scheme: scheme,
        configuration: "Release",
        export_method: "development",
        skip_codesigning: true,
        archive_path: "./build/#{scheme}.xcarchive",
        output_directory: "./build/ipa",
        output_name: "#{app_name}.ipa"
      )
    end
  end

  desc "Create app on App Store Connect"
  lane :create_app do |options|
    app_name = options[:app_name] || "MyApp"
    bundle_id = options[:bundle_id] || "com.example.app"
    
    produce(
      app_name: app_name,
      app_identifier: bundle_id,
      language: "en-US",
      app_version: "1.0",
      sku: "#{bundle_id.gsub('.', '-')}-#{Time.now.to_i}",
      skip_itc: false,
      skip_devcenter: false
    )
  end

  desc "Upload IPA to App Store Connect"
  lane :upload_ipa do |options|
    ipa_path = options[:ipa_path] || Dir.glob("./build/ipa/*.ipa").first
    
    if ipa_path && File.exist?(ipa_path)
      upload_to_app_store(
        ipa: ipa_path,
        skip_screenshots: true,
        skip_metadata: true,
        skip_app_version_update: true,
        force: true,
        precheck_include_in_app_purchases: false
      )
    else
      UI.error("No IPA file found at #{ipa_path}")
    end
  end

  desc "Complete build and upload process"
  lane :build_and_upload do |options|
    build_archive(options)
    create_app(options)
    upload_ipa(options)
  end
end
