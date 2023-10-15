Pod::Spec.new do |s|
  s.name             = 'CalmoCoreUIComponents'
  s.version          = '1.0.4'
  s.summary          = 'CORE UI for CalmoCoreUIComponents'
  s.homepage         = 'https://github.com/DedSecTeam17/CalmoCoreUIComponents'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Quick Bird' => 'mascot@quickbirdstudios.com' }
  s.source           = { :git => 'https://github.com/DedSecTeam17/CalmoCoreUIComponents.git', :tag => s.version.to_s }
  s.ios.deployment_target = '16.0'
  s.swift_version = '5.9'
  s.source_files = 'Sources/CalmoCoreUIComponents/**/*'
end
