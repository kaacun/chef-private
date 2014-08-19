bash "install norikra" do
  code <<-EOC
    /opt/jruby-#{node['jruby']['version']}/bin/gem install norikra
    norikra start
  EOC
  creates "/opt/jruby-#{node['jruby']['version']}/bin/norikra"
end
