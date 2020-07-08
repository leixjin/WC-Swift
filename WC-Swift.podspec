Pod::Spec.new do |s|
  s.name             = 'WC-Swift'
  s.version          = '0.1.2'
  s.summary          = 'WalletConnect Swift SDK.'
  s.description      = 'WalletConnect Swift SDK Modified Version.'

  s.homepage         = 'https://github.com/leixjin/WC-Swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hewigovens' => '360470+hewigovens@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/leixjin/WC-Swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.source_files = 'WalletConnect/**/*'
  s.exclude_files = ["WalletConnect/Info.plist"]
  s.swift_version = '5.0'
  s.static_framework = true
  
  s.dependency 'CryptoSwift', '1.1.3'
  s.dependency 'Starscream',  '3.1.1'
  s.dependency 'PromiseKit',  '6.11.0'
  s.dependency 'AnyCodable-FlightSchool', '0.2.3'
end
