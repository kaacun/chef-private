#
# Cookbook Name:: java
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "java-#{node['java']['version']}-openjdk" do
  action :install
end
