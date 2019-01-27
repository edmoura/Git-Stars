# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
inhibit_all_warnings!

def mainPods
  pod 'SnapKit', '~> 4.0.0'
  pod 'SDWebImage', '~> 4.0'
  pod 'Viperit'
  pod 'Moya', '~> 11.0'
  pod 'lottie-ios'
  pod 'SkeletonView'
end

def mainPodsTests
  pod 'Quick'
  pod 'Nimble'
  pod 'Viperit'
  pod 'Moya', '~> 11.0'
end


target 'GitStars' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  mainPods

  target 'GitStarsTests' do
    inherit! :search_paths
    mainPodsTests
  end

  target 'GitStarsUITests' do
    inherit! :search_paths
    mainPods
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'YES'
      config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'YES'
    end
  end
end
