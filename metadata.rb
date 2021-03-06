name 'gemirro'
maintainer 'Numergy'
maintainer_email 'pierre.rambaud@numergy.com'
license 'Apache 2.0'
description 'Installs/Configures gemirro'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.3.1'

depends 'apt'
depends 'nginx'
depends 'apache2'
depends 'hostsfile'

%w( debian ubuntu ).each do |os|
  supports os
end

source_url 'https://github.com/Numergy/gemirro-cookbook' if
  respond_to?(:source_url)
issues_url 'https://github.com/Numergy/gemirro-cookbook/issues' if
  respond_to?(:issues_url)
