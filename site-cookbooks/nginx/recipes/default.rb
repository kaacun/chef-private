#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file "/etc/yum.repos.d/nginx.repo" do
end

package "nginx" do
  action :install
  version "1.4.3-1.el6.ngx"
end

template "/etc/nginx/nginx.conf" do
  source "etc/nginx/nginx.conf.erb"
  notifies :reload, 'service[nginx]'
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start]
end
