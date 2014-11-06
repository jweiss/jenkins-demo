name             'jenkins_proxy'
maintainer       'AWS OpsWorks'
description      'Configures Jenkins CI Nginx proxy'
version          '1.0.0'

recipe 'default', 'Installs Nginx proxy'

depends 'nginx'
