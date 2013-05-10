template "test text file" do
    path "/tmp/test.txt"
    source "test.txt.erb"
    owner "root"
    group "root"
    mode "0600"
end
