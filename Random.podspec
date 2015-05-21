Pod::Spec.new do |s|
  s.name             = "Random"
  s.version          = "0.1.0"
  s.summary          = "This is a library that return a value to the random."
  s.description      = <<-DESC
                        This is a library that return a value to the random.
                        This can return an int and String.
                       DESC
  s.homepage         = "https://github.com/akuraru/Random"
  s.license          = 'MIT'
  s.author           = { "akuraru" => "akuraru@gmail.com" }
  s.social_media_url = 'https://twitter.com/akuraru'
  s.source           = { :git => "https://github.com/akuraru/RandomSwift.git", :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.requires_arc = true

  s.source_files = 'Classes/*.swift'
end
