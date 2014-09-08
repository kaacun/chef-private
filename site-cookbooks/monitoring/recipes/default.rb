#
# Cookbook Name:: monitoring
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
log '## install munin-node #####################'
package "munin-node" do
  action :install
  options "--disablerepo=rpmforge"
end
template '/etc/munin/munin-node.conf' do
  source 'etc/munin/munin-node.conf.erb'
end
service 'munin-node' do
  action [ :enable, :start]
end

log '## install zabbix-agent #####################'
package "zabbix-agent" do
  action :install
end
template '/etc/zabbix/zabbix_agentd.conf' do
  source 'etc/zabbix/zabbix_agentd.conf.erb'
end
service 'zabbix-agent' do
  action [ :enable, :start]
end

log '## install monit #####################'
package "monit" do
  action :install
end
template '/etc/monit.conf' do
  source 'etc/monit.conf.erb'
end
node['monitoring']['monit']['processes'].each do |process|
  template "/etc/monit.d/#{process}.conf" do
    source 'etc/monit.d/process.conf.erb'
    variables({
      :process => process
    })
  end
end
service 'monit' do
  action [ :enable, :start]
end
