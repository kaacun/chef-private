bash "install nerdtree" do
  cwd "/root"
  code "echo NeoBundle 'scrooloose/nerdtree' >> /root/.vimrc"
  not_if "grep nerdtree /root/.vimrc"
end
