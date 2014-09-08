#
# Cookbook Name:: initialize
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
# # action #####################################
# yum-plugin-priorities, fastestmirrorのインストール
# リポジトリの追加(rpmforge, epel, remi[option])
# yumパッケージのアップデート
# selinuxの停止
# iptablesの停止
# /app, /app/ENV, /AccessLog.localの作成
# timezone, langの設定
# 
log '== start initialize^^ =============================='

log '## disable selinux ####################'
execute "disable selinux enforcement" do
  only_if "which selinuxenabled && selinuxenabled"
  command "setenforce 0"
  action :run
  notifies :create, "template[/etc/selinux/config]"
end

template "/etc/selinux/config" do
  action :nothing
  source "etc/selinux/config.erb"
end

log '## stop iptables ####################'
%w{iptables ip6tables}.each do |pkg|
  service pkg do
    action [:disable, :stop]
  end
end

log '## setting timezone ####################'
execute "setting timezone" do
  creates "/etc/localtime/Japan"
  command <<-EOC
    rm -f /etc/localtime
    cp -p /usr/share/zoneinfo/Japan /etc/localtime
  EOC
end

log '## setting lang ####################'
cookbook_file "/etc/sysconfig/i18n" do
end

log '## setting ntp ####################'
service "ntpd" do
    action [ :enable, :start ]
end
template "/etc/ntp.conf" do
  source "etc/ntp.conf.erb"
  notifies :restart, 'service[ntpd]'
end

log '## setting dns ####################'
template "/etc/resolv.conf" do
  source "etc/resolv.conf.erb"
end

log '## setting bash prompt ####################'
template "/etc/profile.d/prompt.sh" do
    source "etc/profile.d/prompt.sh.erb"
end

log '## installing yum-plugin-priorities, fastestmirror ####################'
%w{yum-plugin-priorities yum-plugin-fastestmirror}.each do |pkg|
  package pkg do
    action :install
  end
end
log '## add repositories ####################'
# base
template '/etc/yum.repos.d/CentOS-Base.repo' do
  source 'etc/yum.repos.d/CentOS-Base.repo.erb'
  mode 0644
end

# rpmforge, epel, remi
%w{rpmforge epel remi}.each do |repo|
  if 'remi' != repo || 1 == node['initialize']['repo']['remi']['do_install'] then
    log "## add_#{repo} ##################"
    bash "add_#{repo}" do
      code <<-EOC
        rpm --import #{node['initialize']['repo'][repo]['gpg_key']}
      EOC
    end

    template "/etc/yum.repos.d/#{repo}.repo" do
      source "etc/yum.repos.d/#{repo}.repo.erb"
      mode 0644
    end
  else
    log 'installing remi is skipped'
  end
end

log '== initialize, done ============================='
