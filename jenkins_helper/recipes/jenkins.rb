template '/var/lib/jenkins/config.xml' do
  source 'global.xml.erb'
  variables :environment_variables => {
    "OpsWorksInstanceID" => node[:opsworks][:instance][:id]
  }
  owner 'jenkins'
  group 'jenkins'
  mode 0644
end

jenkins_plugin 'ruby'
jenkins_plugin 'rake'

jenkins_plugin 'git' do
  notifies :restart, 'service[jenkins]', :immediately
end

{'aws-sdk' => nil}.each do |gem_name, version|
  execute "/usr/local/bin/gem install --no-ri --no-rdoc #{gem_name} #{"--version #{version}" if version}"
  execute "/usr/bin/gem install --no-ri --no-rdoc #{gem_name} #{"--version #{version}" if version}"
end
