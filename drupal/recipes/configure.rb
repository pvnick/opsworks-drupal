execute "mysql-grant-privileges" do
  command "/usr/bin/mysql -h#{node['mysql']['database']['hostname']} -u#{node['mysql']['master_username']} -p#{node['mysql']['master_password']} < /tmp/grant-privs.sql"
  action :nothing
end


template "Grant privileges to mysql account for app db" do
  path "/tmp/grant-privs.sql"
  source "grant-privs.sql.erb"
  owner "root"
  group "root"
  mode "0600"
  variables(
    :username => node['drupal']['db']['user'],
    :password => node['drupal']['db']['password'],
    :database => node['drupal']['db']['database']
  )
  notifies :run, "execute[mysql-grant-privileges]", :immediately
end
