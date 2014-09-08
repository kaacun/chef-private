# repo install
# --------------------------------
# rpmforge
default['initialize']['repo']['rpmforge']['gpg_key'] = 'http://apt.sw.be/RPM-GPG-KEY.dag.txt'
default['initialize']['repo']['rpmforge']['install'] = 'http://apt.sw.be/redhat/el6/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm'

# epel
default['initialize']['repo']['epel']['gpg_key'] = 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
default['initialize']['repo']['epel']['install'] = 'http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'

# remi
default['initialize']['repo']['remi']['gpg_key'] = 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
default['initialize']['repo']['remi']['install'] = 'http://rpms.famillecollet.com/enterprise/remi-release-6.rpm'


# repo setting
# --------------------------------
# rpmforge
default['initialize']['repo']['rpmforge']['rpmforge']['enabled'] = 1
default['initialize']['repo']['rpmforge']['rpmforge_extras']['enabled'] = 0
default['initialize']['repo']['rpmforge']['rpmforge_testing']['enabled'] = 0

# epel
default['initialize']['repo']['epel']['epel']['enabled'] = 1
default['initialize']['repo']['epel']['epel_debuginfo']['enabled'] = 0
default['initialize']['repo']['epel']['epel_source']['enabled'] = 0

#remi
default['initialize']['repo']['remi']['do_install'] = 1
default['initialize']['repo']['remi']['remi']['enabled'] = 0


# selinux
# --------------------------------
default['initialize']['selinux']['selinux'] = 'disabled'
default['initialize']['selinux']['selinuxtype'] = 'targeted'

# ntp
default['initialize']['ntp']['server'][0] = 'ntp1.jst.mfeed.ad.jp'
default['initialize']['ntp']['server'][1] = 'ntp2.jst.mfeed.ad.jp'
# DNS
default['initialize']['dns']['server'][0] = '8.8.8.8'
default['initialize']['dns']['server'][1] = '8.8.4.4'

default['initialize']['prompt'] = '\\[\\033[1;32m\\][\\t][\\u@\\h \\w]\\\\$\\[\\033[0m\\] '
