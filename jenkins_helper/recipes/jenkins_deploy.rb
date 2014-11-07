template node[:jenkins_helper][:deployer_binary] do
  source 'opsworks_deployer.rb.erb'
  variables :environment_variables => {
    "OpsWorksInstanceID" => node[:opsworks][:instance][:id]
  }
  owner 'jenkins'
  group 'jenkins'
  mode 0750
end

node[:deploy].each do |app, deploy|
  config_file = "/tmp/jenkins-config-#{app}.xml"

  template config_file do
    source 'job.xml.erb'
    variables :scm_url => deploy[:scm][:repository]
    owner 'jenkins'
    group 'jenkins'
    mode 0644
  end

  jenkins_job app do
    config config_file
  end
end
