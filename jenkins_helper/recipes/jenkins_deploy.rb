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
