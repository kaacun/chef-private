#
# Cookbook Name:: haskell
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "get rpm" do
  cwd "/usr/local/src"
  code <<-EOC
    wget #{node['haskell']['rpm']['url']}#{node['haskell']['rpm']['source']}
  EOC
  creates "/usr/bin/ghci"
end

rpm_package "haskell" do
  action :install
  source "/usr/local/src/#{node['haskell']['rpm']['source']}"
end

package "haskell" do
  action :install
end
