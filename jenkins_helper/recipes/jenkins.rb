jenkins_plugin 'ruby'
jenkins_plugin 'rake'

jenkins_plugin 'git' do
  notifies :restart, 'service[jenkins]', :immediately
end