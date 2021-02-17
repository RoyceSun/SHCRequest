Pod::Spec.new do |s|
  s.name             = 'SHCRequest' # 名称
  s.version          = '1.0.1' # 版本号
  s.summary          = '网络请求模块' # 概述
  s.homepage         = 'https://github.com/RoyceSun/SHCRequest'  # 主页
  s.license          = { :type => 'MIT', :file => 'LICENSE' }  # license证书
  s.author           = { "sunhaichen" => "heaven_sunhaichen@163.com" } # 作者
  s.source           = { :git => 'https://github.com/RoyceSun/SHCRequest.git', :tag => s.version.to_s }  # 源代码地址
  s.ios.deployment_target = '9.0' # iOS版本
  s.source_files = 'Classes/**/*.{h,m}' # 源码所在路径
end
