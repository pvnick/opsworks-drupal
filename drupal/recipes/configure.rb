execute "mysql-grant-privileges" do
  command "/usr/bin/mysql -h#{node['mysql']['hostname']} -u#{node['mysql']['master_username']} -p#{node['mysql']['master_password']} < /tmp/create-db-and-grant-privs.sql"
  action :nothing
end


template "Grant privileges to mysql account for app db" do
  path "/tmp/create-db-and-grant-privs.sql"
  source "create-db-and-grant-privs.sql.erb"
  owner "root"
  group "root"
  mode "0600"
  variables(
    :username => node['drupal']['database']['username'],
    :password => node['drupal']['database']['password'],
    :database => node['drupal']['database']['database_name']
  )
  notifies :run, resources(:execute => "mysql-grant-privileges"), :immediately
end
