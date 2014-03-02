cookbook_file "/etc/selinux/config" do
  source "selinuxconfig"
end
=begin
bash "set selinux off" do
#  only_if "getenforce"
  code <<-EOC
    setenforce 0
  EOC
end
=end
