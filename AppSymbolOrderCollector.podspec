#
# Be sure to run `pod lib lint AppSymbolOrderCollector.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AppSymbolOrderCollector'
  s.version          = '0.1.1'
  s.summary          = 'Collect Symbol Order.'
  s.homepage         = 'https://github.com/YiYiZheng/AppSymbolOrderCollector'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '郑一一' => 'qzzyy2014@163.com' }
  s.source           = { :git => 'https://github.com/YiYiZheng/AppSymbolOrderCollector.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.ios.source_files = 'AppSymbolOrderCollector/AppSymbolOrderCollector.{h,m}'
  s.ios.preserve_path = 'AppSymbolOrderCollector/AppSymbolOrderCollectorHelper.rb'
  
  s.ios.user_target_xcconfig = {
    'OTHER_CFLAGS' => '-fsanitize-coverage=func,trace-pc-guard',
    'OTHER_SWIFT_FLAGS' => '-sanitize=undefined -sanitize-coverage=func'
  }
end
