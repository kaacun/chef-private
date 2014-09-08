default['monitoring']['zabbix']['server'] = "xxx"
default['monitoring']['monit']['processes'] = [
  'httpd',
  'zabbix-agent',
  'munin-node'
]
default['monitoring']['monit']['pid']['httpd'] = "/var/run/httpd/httpd.pid"
default['monitoring']['monit']['pid']['zabbix-agent'] = "/var/run/zabbix/zabbix_agentd.pid"
default['monitoring']['monit']['pid']['munin-node'] = "/var/run/munin/munin-node.pid"
