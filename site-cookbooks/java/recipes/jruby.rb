bash "install jruby" do
  creates "/opt/jruby-#{node['jruby']['version']}"
  code <<-EOC
    cd /usr/local/src
    wget http://jruby.org.s3.amazonaws.com/downloads/#{node['jruby']['version']}/jruby-bin-#{node['jruby']['version']}.tar.gz
    tar zxvf jruby-bin-#{node['jruby']['version']}.tar.gz
    mv jruby-#{node['jruby']['version']} /opt/
    export PATH=$PATH:/opt/jruby-#{node['jruby']['version']}/bin
  EOC
end
