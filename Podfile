source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target 'RandomTest', :exclusive => true do
  pod "RandomTest", :git => "./"
  pod 'Alamofire'
end

target 'Tests', :exclusive => true do
  pod "RandomTest", :git => "./"
  pod 'Alamofire'

  pod 'Kiwi'
  pod 'FBSnapshotTestCase'
end
