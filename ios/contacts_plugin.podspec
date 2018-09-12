#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'contacts_plugin'
  s.version          = '0.0.3'
  s.summary          = 'A Flutter contacts plugin which provides easy access to the platform specific address book.'
  s.description      = <<-DESC
A Flutter contacts plugin which provides easy access to the platform specific address book.
                       DESC
  s.homepage         = 'https://github.com/BaseflowIT/flutter-contacts-plugin'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Baseflow' => 'hello@baseflow.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  
  s.ios.deployment_target = '8.0'
end

