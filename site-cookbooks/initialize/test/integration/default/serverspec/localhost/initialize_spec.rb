require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe selinux do
  it { should be_disabled }
end

describe package('ntp') do
  it { should be_installed }
end
describe service('ntpd') do
  it { should be_enabled }
#  it { should be_running }
end

describe host('google.com') do
  it { should be_resolvable }
end

%w{rpmforge epel remi}.each do |repo|
  describe yumrepo(repo) do
    it { should exist }
  end
end
