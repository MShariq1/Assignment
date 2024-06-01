# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

workspace 'Assignment.xcworkspace'
project 'Assignment.xcodeproj'

def networking_pod
  pod 'Networking', :path => 'DevPods/Networking'
end

def listing_details_pod
  pod 'ListingDetails', :path => 'DevPods/ListingDetails'
end

def listings_pod
  pod 'Listings', :path => 'DevPods/Listings'
end

def entity_pod
  pod 'Entity', :path => 'DevPods/Entity'
end

def development_pods
  networking_pod
  listing_details_pod
  listings_pod
  entity_pod
end

target 'Assignment' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Assignment

  pod 'Alamofire', '~> 4.9.0'
  pod 'SwiftyJSON'
  
  use_modular_headers!
  pod 'RealmSwift'
  
  development_pods
  

end

target 'AssignmentTests' do
  inherit! :search_paths
  # Pods for testing
end

target 'AssignmentUITests' do
  # Pods for testing
end

target 'Networking_Example' do
  use_frameworks!
  project 'DevPods/Networking/Example/Networking.xcodeproj'
  
  networking_pod
end

target 'ListingDetails_Example' do
  use_frameworks!
  project 'DevPods/ListingDetails/Example/ListingDetails.xcworkspace'
  
  listing_details_pod
end

target 'Listings_Example' do
  use_frameworks!
  project 'DevPods/Listings/Example/Listings.xcworkspace'
  
  listings_pod
end

target 'Entity_Example' do
  use_frameworks!
  project 'DevPods/Entity/Example/Entity.xcworkspace'
  
  entity_pod
end
  

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end
