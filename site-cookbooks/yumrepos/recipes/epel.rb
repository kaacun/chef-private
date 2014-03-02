bash "epel" do
  creates "/etc/yum.repos.d/epel.repo"
  code <<-EOC
    rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
  EOC
end
