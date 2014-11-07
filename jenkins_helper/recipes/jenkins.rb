jenkins_plugin 'ruby'
jenkins_plugin 'rake'

jenkins_plugin 'git' do
  notifies :restart, 'service[jenkins]', :immediately
end

{'awsk-sdk' => nil}.each do |gem_name, version|
  execute "/usr/local/bin/gem install --no-ri --no-rdoc #{gem_name} #{"--version #{version}" if version}"
end
