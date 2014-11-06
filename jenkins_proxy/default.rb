include_recipe 'nginx::default'
include_recipe 'nginx::service'

cookbook_file '/etc/nginx/sites-available/jenkins' do
  source 'nginx-site'
  owner 'root'
  mode 0640
end

execute 'enable jenkins nginx site' do
  command 'nxensite jenkins'
  notifies :restart, resources(:service => 'nginx'), :immediately
end

execute 'disable default nginx site' do
  command 'nxdissite default'
  notifies :restart, resources(:service => 'nginx'), :immediately
  only_if do
    ::File.exists?('/etc/nginx/sites-enabled/default')
  end
end