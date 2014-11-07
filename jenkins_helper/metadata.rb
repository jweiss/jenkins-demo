name             'jenkins_helper'
maintainer       'AWS OpsWorks'
description      'Configures Jenkins CI Nginx proxy'
version          '1.0.0'

recipe 'default', 'Main recipe'
recipe 'nginx', 'Installs Nginx proxy'
recipe 'jenkins', 'Manage Jenkins'

depends 'nginx'
