name 'gemirro'
maintainer 'Numergy'
maintainer_email 'pierre.rambaud@numergy.com'
license 'Apache 2.0'
description 'Installs/Configures gemirro'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.3.0'

depends 'apt'
depends 'nginx'
depends 'apache2'
depends 'hostsfile'

%w( debian ubuntu ).each do |os|
  supports os
end
