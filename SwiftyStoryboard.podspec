Pod::Spec.new do |s|

  s.name         = "SwiftyStoryboard"
  s.version      = "0.1.0"
  s.summary      = "A framework that helps you to operate with UIStoryboard and it’s components."
  s.homepage     = "https://github.com/RogyMD/SwiftyStoryboard"
  s.license      = { :type => "MIT" }

  s.author             = { "Igor Bidiniuc" => "igorbidiniuc@gmail.com" }
  
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/RogyMD/SwiftyStoryboard.git", :tag => s.version }
  s.source_files  = "SwiftyStoryboard", "SwiftyStoryboard/SwiftyStoryboard/*.swift"
  s.framework = 'UIKit'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

end
