#
# Be sure to run `pod lib lint FSDAirportFlipLabel.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "FSDAirportFlipLabel"
  s.version          = "0.1.0"
  s.summary          = "UILabel like old Airport Flipping labels"
  s.description      = <<-DESC
                       A UILabel subclass that will animate text changes by flipping the labels like those old airport labels that flip to display flight times.

                       DESC
  s.homepage         = "https://github.com/felix-dumit/FSDAirportFlipLabel"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Felix Dumit" => "felix.dumit@gmail.com" }
  s.source           = { :git => "https://github.com/felix-dumit/FSDAirportFlipLabel.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/felix_dumit'

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
