#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "vim" do
  action :remove
end

package "vim-enhanced" do
  action :remove
end

package "ncurses-devel" do
  action :install
end

package "python-devel" do
  action :install
end

bash "install vim" do
  cwd "/tmp"
  code <<-EOC
    wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
    tar -xf vim-7.3.tar.bz2
    cd vim73
    ./configure --with-features=huge --enable-multibyte --enable-pythoninterp --enable-gpm --enable-cscope --enable-fontset
    make
    make install
  EOC
  creates "/usr/local/bin/vim"
end

