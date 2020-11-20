Pod::Spec.new do |spec|
  spec.name         = "LBActionSheetController"
  spec.version      = "1.0.0"
  spec.summary      = "LBActionSheetController"
  spec.description  = "类似于微信的ActionSheetController。"
  spec.homepage     = "https://github.com/A1129434577/LBActionSheetController"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "刘彬" => "1129434577@qq.com" }
  spec.platform     = :ios
  spec.ios.deployment_target = '8.0'
  spec.source       = { :git => 'https://github.com/A1129434577/LBActionSheetController.git', :tag => spec.version.to_s }
  spec.dependency     "LBPresentTransitions"
  spec.dependency     "LBCommonComponents"
  spec.source_files = "LBActionSheetController/**/*.{h,m}"
  spec.requires_arc = true
end
#--use-libraries
