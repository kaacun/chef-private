cookbook_file "/etc/sysconfig/i18n" do
end
bash "set lang" do
  code <<-EOC
    source /etc/sysconfig/i18n
  EOC
end
