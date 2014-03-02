bash "setting datetime" do
  creates "/etc/localtime/Japan"
  code <<-EOC
    rm -f /etc/localtime
    cp -p /usr/share/zoneinfo/Japan /etc/localtime
  EOC
end
