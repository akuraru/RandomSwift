Pod::Spec.new do |s|
  s.name             = "Random"
  s.version          = "0.1.0"
  s.summary          = "A short description of Random."
  s.description      = <<-DESC
                       DESC
  s.homepage         = "https://github.com/<GITHUB_USERNAME>/Random"
  s.license          = 'MIT'
  s.author           = { "akuraru" => "akuraru@gmail.com" }
  s.social_media_url = 'https://twitter.com/akuraru'
  s.source           = { :git => "https://github.com/akuraru/Random.git", :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*.swift'
  s.resource_bundles = {
    'Random' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'Foundation'
end
