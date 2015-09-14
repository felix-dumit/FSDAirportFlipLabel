Pod::Spec.new do |s|
  s.name             = "FSDAirportFlipLabel"
  s.version          = "0.1.1"
  s.summary          = "UILabel like old Airport Flipping labels"
  s.description      = <<-DESC
                       A UILabel subclass that will animate text changes by flipping the labels like those old airport labels that flip to display flight times.

                       DESC
  s.homepage         = "https://github.com/felix-dumit/FSDAirportFlipLabel"
  s.screenshots     = "https://raw.githubusercontent.com/felix-dumit/FSDAirportFlipLabel/master/example.gif"
  s.license          = 'MIT'
  s.author           = { "Felix Dumit" => "felix.dumit@gmail.com" }
  s.source           = { :git => "https://github.com/felix-dumit/FSDAirportFlipLabel.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/felix_dumit'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'FSDAirportFlipLabel' => ['Pod/Assets/*.{png,aiff}']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
