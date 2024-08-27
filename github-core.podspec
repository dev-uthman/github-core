Pod::Spec.new do |s|
  s.name             = 'github-core'
  s.version          = '0.1.0'
  s.summary          = 'A short description of github-core.'


  s.description      = "Módulo de core do app GithubProjectIOS"

  s.homepage         = 'https://github.com/dev-uthman/github-core'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Diego Uthman' => 'diegouhtman5@gmail.com' }
  s.source           = { :git => 'https://github.com/dev-uthman/github-core.git', :tag => s.version.to_s }
  
  s.dependency 'RxSwift', '6.5.0'
  s.dependency 'RxCocoa', '6.5.0'

  s.ios.deployment_target = '10.0'
  s.source_files = 'github-core/Classes/**/*'
  s.exclude_files = "Classes/Exclude"
  s.source_files = ["#{s.name}/**/*.{swift}", "#{s.name}/**/*.{h}", "#{s.name}/**/*.{m}"]
  s.public_header_files = '*.h'
  s.resources = ["#{s.name}/**/*.{png}", "#{s.name}/**/*.{jpeg}", "#{s.name}/**/*. {jpg}",  "#{s.name}/**/*.{pdf}", "#{s.name}/**/*.{storyboard}", "#{s.name}/**/*.{ttf}", "#{s.name}/**/*.{xib}", "#{s.name}/**/*.{json}", "#{s.name}/**/*.{xcassets}", "#{s.name}/**/*.{strings}"]
  
  
end
