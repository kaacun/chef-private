#
# Cookbook Name:: tools
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# # action #####################################
# 各種ユーティリティ系のインストール
# 
#
log '== start tools =================================='

log '## install/upgrade tools #####################'
node['tools']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

template '/etc/profile.d/history.sh' do
  source 'etc/profile.d/history.sh.erb'
end

log '== tools, done =================================='
