cookbook_file "/etc/ssh/sshd_config" do
end
=begin
bash "set selinux off" do
#  only_if "getenforce"
  code <<-EOC
    setenforce 0
  EOC
end
=end
