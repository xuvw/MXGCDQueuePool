#
# Be sure to run `pod lib lint MXGCDQueuePool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MXGCDQueuePool'
  s.version          = '0.1.0'
  s.summary          = 'GCD队列工具，防止线程爆炸'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        GCD队列工具，防止线程爆炸
                       DESC

  s.homepage         = 'https://github.com/xuvw/MXGCDQueuePool'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xuvw' => 'smileshitou@hotmail.com' }
  s.source           = { :git => 'https://github.com/xuvw/MXGCDQueuePool.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'MXGCDQueuePool/Classes/**/*'

end
