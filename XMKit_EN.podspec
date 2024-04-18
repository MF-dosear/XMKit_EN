Pod::Spec.new do |s|
  s.name             = 'XMKit_EN'
  s.version          = '1.0.0'
  s.summary          = 'XMKit_EN. iLife 游戏 北美库'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/MF-dosear/XMKit_EN'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dosear@qq.com' => 'dosear@qq.com' }
  s.source           = { :git => 'https://github.com/MF-dosear/XMKit_EN.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '13.0'

  s.requires_arc = true
  
  valid_archs = ['arm64']

  s.public_header_files = ['XMKit_EN/Classes/**/*.h','XMKit_EN/Libraries/**/*.h']

  s.source_files = ['XMKit_EN/Classes/**/*','XMKit_EN/Libraries/**/*.h']
  
  s.frameworks  = 'StoreKit','WebKit','WatchConnectivity','Social','EventKit','SystemConfiguration','MobileCoreServices','MessageUI','JavaScriptCore','CoreTelephony','CoreMedia','AVFoundation','AudioToolbox','AdSupport','UIKit'
  
  s.libraries = 'z','z.1.2.5','bz2.1.0','c++'

#  s.vendored_frameworks = ['XMKit_EN/Frameworks/*.framework']
#  s.subspec 'XMSDK' do |dm|
#      dm.vendored_frameworks = 'XMKit_EN/Frameworks/XMSDK.framework'
#  end
  
#  s.dependency 'AppLovinSDK'
#  s.dependency 'AppLovinMediationFyberAdapter'
#  s.dependency 'AppLovinMediationGoogleAdManagerAdapter'
#  s.dependency 'AppLovinMediationGoogleAdapter'
#  s.dependency 'AppLovinMediationInMobiAdapter'
#  s.dependency 'AppLovinMediationIronSourceAdapter'
#  s.dependency 'AppLovinMediationVungleAdapter'
#  s.dependency 'AppLovinMediationFacebookAdapter'
#  s.dependency 'AppLovinMediationMintegralAdapter'
#  s.dependency 'AppLovinMediationUnityAdsAdapter'
#  s.dependency 'AppLovinMediationVerveAdapter'
#  s.dependency 'AppLovinMediationByteDanceAdapter'
  
#  s.dependency 'AppsFlyerFramework'
#  s.dependency 'FirebaseAnalytics'
#  s.dependency 'FirebaseMessaging'
  
  s.static_framework = false
  
  # 指定Info.plist文件
  s.info_plist = {
    'UIViewControllerBasedStatusBarAppearance' => false,
    'NSPhotoLibraryUsageDescription' => 'Your app needs to access your photo library',
    'NSCameraUsageDescription' => 'Your app needs to use your camera',
    'GADApplicationIdentifier' => 'ca-app-pub-4218048500643655~7205431006'
  }
  
end
