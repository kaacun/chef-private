bash "install nerdtree" do
  cwd "/root"
  code <<-EOC
    echo "NeoBundle 'scrooloose/nerdtree'" >> /root/.vimrc
  EOC
  not_if "grep nerdtree /root/.vimrc"
end
