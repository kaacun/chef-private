#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'docker-io' do
  action :install
end

service 'docker' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start]
end
