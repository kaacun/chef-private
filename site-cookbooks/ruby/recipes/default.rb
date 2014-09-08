#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "install ruby" do
  creates "/usr/local/bin/ruby"
  code <<-EOC
    cd /usr/local/src
    curl -O #{node['ruby']['source_path']}ruby-#{node['ruby']['version']}.tar.gz
    tar zxvf ruby-#{node['ruby']['version']}.tar.gz
    cd ruby-#{node['ruby']['version']}
    /bin/sh ./configure
    /usr/bin/make
    /usr/bin/make install
  EOC
end
