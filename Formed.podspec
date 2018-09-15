#
#  Be sure to run `pod spec lint Formed.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#


Pod::Spec.new do |s|
          #1.
          s.name               = "Formed"
          #2.
          s.version            = "0.0.1"
          #3.  
          s.summary         = "A simple form pod to help with the quick creation of basic form interfaces."
          #4.
          s.homepage        = "http://www.yudiz.com"
          #5.
          s.license              = "MIT"
          #6.
          s.author               = "Shaun Anderson"
          #7.
          s.platform            = :ios, "10.0"
          #8.
          s.source              = { :git => "https://github.com/Shaun-Anderson/Formed.git", :tag => "0.0.1" }
          #9.
          s.source_files     = "Formed", "Formed/**/*.{h,m}"
 	  s.resource_bundles = {'Formed' => ['Formed/**/*.xib'] }
end
