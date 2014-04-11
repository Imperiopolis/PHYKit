Pod::Spec.new do |s|
  s.name         = "PHYKit"
  s.version      = "0.0.1"
  s.summary      = "PHYKit aims to be an API compatible implementation of UIKitDynamics for AppKit (OS X)."

  s.description  = <<-DESC
__Currently this is incomplete and should not be used in production!__

The PHYKit project was started last year right after WWDC, but our time to dedicate to the project has dwindled so we decided to push it to GitHub in case our efforts benefit anyone else.

PHYKit aims to be an API compatible implementation of UIKitDynamics for AppKit (OS X). The dynamics use Box2d under the hood, in the same fashion as Apple does.

PHYKit currently supports gravity, collisions, and pushing. Not all functionality is implemented for these dynamic types, for example collisions don't support the callback on when a collision has occurred.

Attachments and springs are a work in progress.
                   DESC

  s.homepage     = "http://github.com/Imperiopolis/PHYKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors              = { "Nathan Trapp" => "nathan@trappdesign.net",
                              "Zev Eisenberg" => "zev@zeveisenberg.com" }

  s.platform     = :osx, "10.8"

  s.source       = { :git => "http://github.com/Imperiopolis/PHYKit.git", :tag => "0.0.1" }

  s.source_files  = "PHYKit/PHYKit.h"
  s.public_header_files = "PHYKit/PHYKit.h" "PHYKit/Public/*.h" "PHYKit/Behaviors/*.h"

  s.requires_arc = true
  s.dependency "box2d"

end
