Pod::Spec.new do |s|
  s.name = 'BlockfrostSwiftSDK'
  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'
  s.tvos.deployment_target = '15.0'
  s.watchos.deployment_target = '8.0'
  s.swift_version = '5.7'
  s.version = '1.0.0'
  s.source = { :git => 'https://github.com/blockfrost/blockfrost-swift.git', :tag => s.version.to_s }
  s.authors = 'Blockfrost Swift SDK'
  s.license = 'MIT'
  s.homepage = 'https://github.com/blockfrost/blockfrost-swift'
  s.summary = 'Blockfrost Swift SDK'
  s.source_files = 'BlockfrostSwiftSDK/Classes/**/*.swift'
  
  s.dependency 'AnyCodable-FlightSchool', '~> 0.6.2'
  s.dependency 'Alamofire', '~> 5.4.3'
end
