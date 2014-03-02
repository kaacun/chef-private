bash "install composer" do
  creates "/usr/local/bin/composer"
  code <<-EOC
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer
  EOC
end
directory '/root/composer-packages' do
  action :create
end
cookbook_file "/root/composer-packages/composer.json" do
end
bash "install composer" do
  cwd "/root/composer-packages"
  code <<-EOC
    composer install
  EOC
end
