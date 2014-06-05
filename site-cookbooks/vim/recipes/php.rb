cookbook_file "/root/.vimrc" do
  source "vimrc_php"
end
bash "neobundle install" do
  code <<-EOC
    vim +":NeoBundleInstall" +:q
  EOC
end
directory '/root/.vim/syntax' do
  action :create
end
cookbook_file "/root/.vim/syntax/quickrun.vim" do
end
