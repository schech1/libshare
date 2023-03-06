Pod::Spec.new do |spec|
    spec.name                     = 'libshare'
    spec.version                  = '1.1'
    spec.homepage                 = 'https://github.com/schech1/libshare'



    spec.source                   = { :git => "https://github.com/schech1/libshare.git", :branch => "main", :tag => "1.1" }

    spec.authors                  = ''
    spec.license                  = ''
    spec.summary                  = 'Some description for the Shared Module'
    spec.vendored_frameworks      = 'libshare/shared.framework'
    spec.libraries                = 'c++'
    spec.ios.deployment_target    = '16.2'
                
                
    spec.pod_target_xcconfig = {
        'KOTLIN_PROJECT_PATH' => ':shared',
        'PRODUCT_MODULE_NAME' => 'shared',

          'KOTLIN_TARGET[sdk=iphonesimulator*]' => 'ios_x64',
          'KOTLIN_TARGET[sdk=iphoneos*]' => 'ios_arm'
    }
                
spec.prepare_command = <<-SCRIPT
      set -ev
      ./gradlew --no-daemon -Pframework=#{spec.name}.framework linkPodReleaseFrameworkIosSimulatorArm64 --stacktrace --info
    SCRIPT


                
end