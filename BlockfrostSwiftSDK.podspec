Pod::Spec.new do |s|
  s.name = 'BlockfrostSwiftSDK'
  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.15'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '6.0'
  s.version = '0.0.7'
  s.source = { :git => 'https://github.com/blockfrost/blockfrost-swift.git', :tag => s.version.to_s }
  s.authors = 'Blockfrost Swift SDK'
  s.license = 'MIT'
  s.homepage = 'https://github.com/blockfrost/blockfrost-swift'
  s.summary = 'Blockfrost Swift SDK'
  s.source_files = 'BlockfrostSwiftSDK/Classes/**/*.swift'
  
  s.dependency 'AnyCodable-FlightSchool', '~> 0.6.2'
  s.dependency 'Alamofire', '~> 5.4.3'
end
