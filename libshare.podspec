Pod::Spec.new do |spec|
    spec.name                     = 'libshare'
    spec.version                  = '1.0'
    spec.homepage                 = 'https://github.com/schech1/libshare'
    spec.source                   = { :git => "https://github.com/schech1/libshare.git", :branch => "main",:tag => "{spec.version}"  }
    spec.authors                  = ''
    spec.license                  = ''
    spec.summary                  = 'Some description for the Shared Module'
    spec.vendored_frameworks      = 'build/cocoapods/framework/shared.framework'
    spec.libraries                = 'c++'
    spec.ios.deployment_target = '16.2'
                
                
    spec.pod_target_xcconfig = {
        'KOTLIN_PROJECT_PATH' => ':shared',
        'PRODUCT_MODULE_NAME' => 'shared',
    }
                
spec.prepare_command = <<-SCRIPT
      set -ev
      ./gradlew --no-daemon -Pframework=#{spec.name}.framework linkPodReleaseFrameworkIosArm64 --stacktrace --info
    SCRIPT
                
end