include_recipe %w{apache2 apache2::mod_php5 apache2::mod_rewrite apache2::mod_expires}
include_recipe %w{php php::module_mysql php::module_gd}
#include_recipe "postfix"
#include_recipe "drupal::drush"

template "/tmp/test.txt" do
    path "/tmp/test.txt"
    source "test.txt.erb"
    owner "root"
    group "root"
    mode "0600"
end
