#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# # action #####################################
# httpd, httpd-develのインストール
# サービスの登録、起動
# 
# 
log '== start httpd ==============================='

log '## installing httpd ####################'
%w{httpd httpd-devel}.each do |pkg|
  package pkg do
    action :install
  end
end

log '## service httpd start #################'
service 'httpd' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start]
  subscribes :restart, 'template[/etc/httpd/conf/httpd.conf]'
end

template '/etc/httpd/conf/httpd.conf' do
  source 'etc/httpd/conf/httpd.conf.erb'
  mode 0644
  notifies :restart, "service[httpd]"
end
log '== httpd, done ============================='
