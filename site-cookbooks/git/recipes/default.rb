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

cookbook_file "/root/.gitconfig" do
end

cookbook_file "/root/.gitignore" do
end
