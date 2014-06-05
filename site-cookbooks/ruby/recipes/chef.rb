gem_package "chef" do
  gem_binary "/usr/local/bin/gem"
  action :install
end
gem_package "knife-solo" do
  gem_binary "/usr/local/bin/gem"
  action :install
end
