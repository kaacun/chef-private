%w{chef knife-solo test-kitchen kitchen-docker}.each do |pkg|
  gem_package pkg do
    gem_binary "/usr/local/bin/gem"
    action :install
  end
end
