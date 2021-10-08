Pod::Spec.new do |s|
  s.name = 'BlockfrostSwiftSDK'
  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.15'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '6.0'
  s.version = '0.0.4'
  s.source = { :git => 'git@github.com:blockfrost/blockfrost-swift.git', :tag => '0.0.4' }
  s.authors = 'Blockfrost Swift SDK'
  s.license = 'MIT'
  s.homepage = 'https://github.com/blockfrost/blockfrost-swift'
  s.summary = 'Blockfrost Swift SDK'
  s.source_files = 'BlockfrostSwiftSDK/Classes/**/*.swift'
  
  s.dependency 'AnyCodable-FlightSchool', '~> 0.6.2'
  s.dependency 'Alamofire', '~> 5.4.3'
  #s.dependency 'AwaitKit', '~> 5.2.0'
  #s.dependency 'SwiftCoroutine', '~>2.1.8'
end
