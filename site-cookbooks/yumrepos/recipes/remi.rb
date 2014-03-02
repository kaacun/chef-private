bash "remi" do
  creates "/etc/yum.repos.d/remi.repo"
  code <<-EOC
    rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
  EOC
end
