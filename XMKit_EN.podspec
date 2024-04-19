Pod::Spec.new do |s|
  s.name             = 'XMKit_EN'
  s.version          = '1.0.1'
  s.summary          = 'XMKit_EN. iLife 游戏 北美库'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/MF-dosear/XMKit_EN'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dosear@qq.com' => 'dosear@qq.com' }
  s.source           = { :git => 'https://github.com/MF-dosear/XMKit_EN.git', :tag => s.version.to_s }
  
  #sdk 支持最低版本
  s.ios.deployment_target = '13.0'
  
  #不支持模拟器
  s.pod_target_xcconfig = {
    'VALID_ARCHS[sdk=iphonesimulator*]' => ''
  }

  #是否支持ARC
  #s.requires_arc = true
  
  #swift版本
  s.swift_version = ['5']
  
  #模式arm64
  valid_archs = ['arm64','x86_64','armv7']
  
  #设置为静态库
  s.static_framework = true

  #暴露的头文件
  s.public_header_files = [
    'XMKit_EN/Classes/XMSDK.h',
    'XMKit_EN/Classes/XMManager.h',
    'XMKit_EN/Classes/Common/XMCommon.h',
    'XMKit_EN/Classes/XMDelegate.h',
    'XMKit_EN/Classes/M/XMInfos.h',
    'XMKit_EN/Classes/Lib/Singleton.h',
  ]

  #系统资源
  s.source_files = [
    'XMKit_EN/Classes/**/*',
  ]
  
  #系统库framework
  s.frameworks  = [
  'StoreKit',
  'WebKit',
  'WatchConnectivity',
  'Social',
  'EventKit',
  'SystemConfiguration',
  'MobileCoreServices',
  'MessageUI',
  'JavaScriptCore',
  'CoreTelephony',
  'CoreMedia',
  'AVFoundation',
  'AudioToolbox',
  'AdSupport',
  'UIKit'
  ]
  
  #系统库library
  s.libraries = [
  'z',
  'z.1.2.5',
  'bz2.1.0',
  'c++'
  ]

  #引用外部framework库
  s.vendored_frameworks = [
  'XMKit_EN/Frameworks/**/*.xcframework'
  ]
  
  #引用外部library库
  #s.vendored_libraries = ['XMKit_EN/Libraries/*']
  
  #bundles
  s.resource_bundles = {
      'XMKit_EN' => ['XMKit_EN/Assets/*']
  }
  
  #pch
  s.prefix_header_file = 'XMKit_EN/Classes/Header/ZPHeader.pch'
  
  # 指定Info.plist文件
  s.info_plist = {
      
  }
  
  #引用git第三方库
  s.dependency 'AppLovinSDK'
  s.dependency 'AppLovinMediationFyberAdapter'
  s.dependency 'AppLovinMediationGoogleAdManagerAdapter'
  s.dependency 'AppLovinMediationGoogleAdapter'
  s.dependency 'AppLovinMediationInMobiAdapter'
  s.dependency 'AppLovinMediationIronSourceAdapter'
  s.dependency 'AppLovinMediationVungleAdapter'
  s.dependency 'AppLovinMediationFacebookAdapter'
  s.dependency 'AppLovinMediationMintegralAdapter'
  s.dependency 'AppLovinMediationUnityAdsAdapter'
  s.dependency 'AppLovinMediationVerveAdapter'
  
  s.dependency 'AppsFlyerFramework', '~> 6.14.0'
  s.dependency 'FirebaseAnalytics', '~> 10.24.0'
  s.dependency 'FirebaseMessaging', '~> 10.24.0'

  s.dependency 'Masonry', '~> 1.1.0'
  s.dependency 'SVProgressHUD', '~> 2.3.1'
  s.dependency 'YYText', '~> 1.0.7'
  s.dependency 'AvoidCrash', '~> 2.5.2'
  s.dependency 'IQKeyboardManager', '~> 6.5.18'
  s.dependency 'AFNetworking', '~> 4.0.1'
  s.dependency 'JKCategories', '~> 1.9.3'
  s.dependency 'FMDB', '~> 2.7.10'
  
end
