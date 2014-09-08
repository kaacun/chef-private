#
# Cookbook Name:: smb
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# # action #####################################
# sambaのインストール
# サービスの登録、起動
# sambaユーザの作成
# sambaのマウント設定
#
#
log '== start smb =========================================='

log '## installing smb #############################'
package 'samba' do
  action :install
  notifies :run, 'execute[create_smbuser]'
end

log '## service smb start #################'
service 'smb' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start]
end

template '/etc/samba/smb.conf' do
  source 'etc/samba/smb.conf.erb'
  notifies :restart, 'service[smb]'
end

execute 'create_smbuser' do
  action :nothing
  not_if "pdbedit -L | grep #{node['smb']['smbuser']['user']}"
  command "echo -e '#{node['smb']['smbuser']['password']}\n#{node['smb']['smbuser']['password']}' | pdbedit -t -a #{node['smb']['smbuser']['user']}"
end

log '== smb, done =========================================='
