#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
log '== start mysql =================================================='
group 'mysql' do
  action :create
  gid 27
end
user 'mysql' do
  action :create
  uid 27
  gid "mysql"
  home "/var/lib/mysql"
  comment 'MySQL Server'
end

bash 'set_rpm' do
  creates "/usr/local/src/mysql-community-release-el6-5.noarch.rpm"
  cwd '/usr/local/src'
  code <<-EOC
    wget #{node['mysql']['source_path']}mysql-community-release-el6-5.noarch.rpm
    wget #{node['mysql']['source_path']}mysql-pgp.txt
    rpm --import mysql-pgp.txt
  EOC
end

log '## installing mysql ###########################'
package 'mysql-community-release-el6-5.noarch' do
  action :install
  source '/usr/local/src/mysql-community-release-el6-5.noarch.rpm'
  not_if "grep 5.6.20 /var/lib/mysql/mysql_upgrade_info"
end
%w{mysql mysql-server mysql-devel}.each do |pkg|
  package pkg do
    action :install
    not_if "grep 5.6.20 /var/lib/mysql/mysql_upgrade_info"
  end
end

template '/etc/my.cnf' do
  source 'etc/my.cnf.erb'
  mode 0644
  notifies :restart, 'service[mysqld]'
end

log '## service mysql start ######################'
service 'mysqld' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start]
end

bash 'mysql_upgrade' do
  not_if "grep 5.6.20 /var/lib/mysql/mysql_upgrade_info"
  code <<-EOC
    mysql_upgrade -u root
  EOC
end

log '== mysql, done =================================================='
