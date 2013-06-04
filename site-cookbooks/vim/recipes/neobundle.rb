directory '/root/.vim' do
  action :create
end
directory '/root/.vim/bundle' do
  action :create
end
bash "git clone" do
  code "git clone http://github.com/Shougo/neobundle.vim /root/.vim/bundle/neobundle.vim"
  creates "/root/.vim/bundle/neobundle.vim"
end
cookbook_file "/root/.vimrc" do
end
