node['normal']['apps'].each do |app_name,settings|
  template "/etc/nginx/conf.d/#{app_name}.conf" do
    source 'etc/nginx/conf.d/vhost.conf.erb'
    notifies :reload, "service[nginx]"
    variables({
      :app_name => app_name,
      :settings => settings
    })
  end
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
end
