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

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Just use to collect symbol order.
                       DESC

  s.homepage         = 'https://github.com/YiYiZheng/AppSymbolOrderCollector'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '郑一一' => 'qzzyy2014@163.com' }
  s.source           = { :git => 'https://github.com/YiYiZheng/AppSymbolOrderCollector.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  
  s.ios.user_target_xcconfig = {
    'OTHER_CFLAGS' => '-fsanitize-coverage=func,trace-pc-guard',
    'OTHER_SWIFT_FLAGS' => '-sanitize=undefined -sanitize-coverage=func'
  }

  s.source_files = 'AppSymbolOrderCollector/Classes/**/*'

end
