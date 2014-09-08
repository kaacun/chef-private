#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "git" do
  action :install
end

template "/root/.gitconfig" do
  source "root/gitconfig"
end

template "/root/.gitignore" do
  source "root/gitignore"
end
