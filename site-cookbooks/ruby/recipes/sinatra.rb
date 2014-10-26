gem_package "sinatra" do
  gem_binary "/usr/local/bin/gem"
  action :install
end
gem_package "sinatra-contrib" do
  gem_binary "/usr/local/bin/gem"
  action :install
end
