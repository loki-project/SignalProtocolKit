platform :ios, '8.0'

use_frameworks!

target 'AxolotlKit' do
  pod 'AxolotlKit', path: '.'
  pod 'SessionCurve25519Kit', git: 'https://github.com/loki-project/session-ios-curve-25519-kit.git', '~> 2.1.1'
  pod 'SessionHKDFKit', git: 'https://github.com/nielsandriesse/session-ios-hkdf-kit.git', '~> 0.0.5'

  target 'AxolotlKitTests' do
    inherit! :search_paths
  end
end
