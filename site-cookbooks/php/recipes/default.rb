#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{php php-devel php-mbstring php-mcrypt php-mysql php-pecl-xdebug}.each do |pkg|
    package pkg do
        options "--enablerepo=remi-php55"
        action :install
    end
end
