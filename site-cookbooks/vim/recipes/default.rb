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

bash "install vim" do
  cwd "/tmp"
  code <<-EOC
    wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
    wget ftp://ftp.jp.vim.org/pub/vim/extra/vim-7.2-extra.tar.gz
    wget ftp://ftp.vim.org/pub/vim/extra/vim-7.2-lang.tar.gz
    tar jxvf vim-7.3.tar.bz2
    tar zxvf vim-7.2-extra.tar.gz
    tar zxvf vim-7.2-lang.tar.gz
    mv vim72 vim73/
    cd vim73/src
    ./configure --enable-multibyte --with-features=huge --disable-selinux --prefix='/usr/local/vim-7.3'
    make install
    echo "alias vim='/usr/local/vim-7.3/bin/vim'" >> /root/.bashrc
    source /root/.bashrc
  EOC
  creates "/tmp/ftp://ftp.vim.org/pub/vim/extra/vim-7.2-lang.tar.gz"
end

