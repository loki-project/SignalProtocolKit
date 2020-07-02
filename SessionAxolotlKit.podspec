Pod::Spec.new do |s|
  s.name                  = "SessionAxolotlKit"
  s.version               = "1.0.3"
  s.summary               = "SessionAxolotlKit is a free implementation of the Axolotl protocol in Objective-C"
  s.homepage              = "https://github.com/loki-project/session-ios-protocol-kit"
  s.license               = "GPLv2"
  s.license               = { :type => "GPLv2", :file => "LICENSE" }
  s.author                = { "Niels Andriesse" => "niels@loki.network" }
  s.social_media_url      = "http://getsession.org/"
  s.source                = { :git => "https://github.com/loki-project/session-ios-protocol-kit.git", :tag => "#{s.version}" }
  s.source_files          = "AxolotlKit/Classes/**/*.{h,m,swift}", "AxolotlKit/Private/*.{h,m,swift}"
  s.public_header_files   = "AxolotlKit/Classes/**/*.{h}"
  s.prefix_header_file    = "AxolotlKit/SPKPrefix.h"
  s.platform              = :ios, '10.0'
  s.requires_arc          = true

  s.dependency            'SessionCurve25519Kit', '~> 2.1.2'
  s.dependency            'SessionHKDFKit', '~> 0.0.5'
  s.dependency            'CocoaLumberjack'
  s.dependency            'SwiftProtobuf', '~> 1.5.0'
  s.dependency            'SessionCoreKit', '~> 1.0.0'

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'AxolotlKitTests/**/*.{h,m,swift}'
  end
end
