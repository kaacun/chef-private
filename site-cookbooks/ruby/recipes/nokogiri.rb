bash "set nokogiri env" do
  code <<-EOC
    env NOKOGIRI_USE_SYSTEM_LIBRARIES=true
  EOC
end
gem_package "nokogiri" do
  gem_binary "/usr/local/bin/gem"
  version "1.6.0"
  action :install
end
