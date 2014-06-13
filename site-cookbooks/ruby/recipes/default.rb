#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "install ruby" do
#  only_if 'which ruby'
  creates "/usr/local/bin/ruby"
  code <<-EOC
    cd /usr/local/src
    curl -O http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz
    tar zxvf ruby-2.1.2.tar.gz
    cd ruby-2.1.2
    /bin/sh ./configure
    /usr/bin/make
    /usr/bin/make install
  EOC
end
