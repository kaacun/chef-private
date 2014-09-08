log '## vhost settings ####################'
node['normal']['apps'].each do |app_name,settings|
  directory "/AccessLog.local/#{app_name}" do
    owner 'root'
    group 'root'
    mode 00755
    action :create
  end
  template "/etc/httpd/conf.d/#{app_name}.conf" do
    source 'etc/httpd/conf.d/vhost.conf.erb'
    notifies :restart, "service[httpd]"
    variables({
      :app_name => app_name,
      :settings => settings
    })
  end
end

service 'httpd' do
  stop_command    "/etc/init.d/httpd stop"
  start_command   "/etc/init.d/httpd start"
  restart_command "/etc/init.d/httpd graceful"
  action :nothing
end
