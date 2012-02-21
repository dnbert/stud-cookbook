maintainer       "Brett Gailey"
maintainer_email "brett.gailey@dreamhost.com"
license          "Apache 2.0"
description      "Installs the parted disk utility"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
depends           "apt"

%w{debian ubuntu}.each do |os|
	supports os
end
