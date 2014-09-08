#
# Cookbook Name:: unicorn
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
gem_package "unicorn-rails" do
  gem_binary "/usr/local/bin/gem"
  action :install
end

directory "/var/run/unicorn" do
  action :create
end

node['normal']['apps'].each do |app_name,settings|
  template "/app/#{app_name}/production/shared/config/unicorn.rb" do
    source "unicorn.rb"
    variables ({:app_name => app_name})
  end
  template "/etc/init.d/#{app_name}" do
    source "etc/init.d/init_script.erb"
    mode 0755
    variables ({:app_name => app_name})
  end
end
