#
# Cookbook Name:: tmux
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "install libevent" do
  cwd "/tmp"
  code <<-EOC
    wget https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz
    tar xvzf libevent-2.0.21-stable.tar.gz
    cd libevent-2.0.21-stable
    ./configure
    make
    make install
  EOC
  creates "/tmp/libevent-2.0.21-stable"
end

bash "install tmux" do
  cwd "/tmp"
  code <<-EOC
    wget -O tmux-1.9a.tar.gz http://sourceforge.net/projects/tmux/files/tmux/tmux-1.9/tmux-1.9a.tar.gz/download?use_mirror=jaist
    tar xvzf tmux-1.9a.tar.gz
    cd tmux-1.9a
    ./configure
    make
    make install
  EOC
  creates "/tmp/tmux-1.9a"
end

bash "setup tmux" do
  cwd "/root"
  code <<-EOC
    echo 'alias tmux="LD_LIBRARY_PATH=/usr/local/lib /usr/local/bin/tmux"' >> /root/.bashrc
  EOC
  not_if "grep tmux /root/.bashrc"
end
