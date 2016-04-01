Pod::Spec.new do |s|
  s.name             = "UIScrollView+ScrollToTopBtn"
  s.version          = "0.0.1"
  s.summary          = "a UIScrollView category for making a scroll to top button"
  s.description      = <<-DESC
                       a UIScrollView category for making a scroll to top button via runtime
                       DESC
  s.homepage         = "https://github.com/litt1e-p/UIScrollView-ScrollToTopBtn"
  s.license          = { :type => 'MIT' }
  s.author           = { "litt1e-p" => "litt1e.p4ul@gmail.com" }
  s.source           = { :git => "https://github.com/litt1e-p/UIScrollView-ScrollToTopBtn.git", :tag => '0.0.1' }
  s.platform = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'UIScrollView+ScrollToTopBtn/*'
  s.frameworks = 'Foundation', 'UIKit'
end

