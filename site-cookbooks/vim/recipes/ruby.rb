cookbook_file "/root/.vimrc" do
  source "vimrc_ruby"
end
bash "neobundle install" do
  code <<-EOC
    vim +":NeoBundleInstall" +:q
  EOC
end
