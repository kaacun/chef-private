#bash "gem update" do
#  code "gem update --system"
#end
cookbook_file "/root/.gemrc" do
  source "gemrc"
end
