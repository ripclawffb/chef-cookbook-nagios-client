name 'nagios_client'
maintainer 'Asif Shakh'
maintainer_email 'ripclaw_ffb@hotmail.com'
license 'Apache-2.0'
description 'Installs/Configures Nagios Client (ncpa)'
version '0.1.0'
chef_version '>= 14.0'

depends 'chef-yum-docker', '~> 3.1.1'
depends 'line', '~> 2.9.0'
depends 'docker', '~> 6.0.3'

supports 'redhat'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/ripclawffb/cookbook-nagios_client/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/ripclawffb/cookbook-nagios_client'
