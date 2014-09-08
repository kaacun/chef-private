require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

%w{httpd httpd-devel}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end
