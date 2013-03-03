template "#{Chef::Config[:file_cache_path]}/#{node['osxdefaults']['terminal']['profile']}.terminal" do
    source "#{node['osxdefaults']['terminal']['profile']}.terminal"
    owner node['current_user']
    mode "0755"
    not_if "defaults read \"com.apple.Terminal\" \"Default Window Settings\" | grep ^#{node['osxdefaults']['terminal']['profile']}$", :user => node['current_user']
end

execute "Load the terminal theme" do
    command "open #{Chef::Config[:file_cache_path]}/#{node["osxdefaults"]["terminal"]["profile"]}.terminal"
    not_if "defaults read \"com.apple.Terminal\" \"Default Window Settings\" | grep ^#{node["osxdefaults"]["terminal"]["profile"]}$", :user => node['current_user']
end

execute "Wait a while" do
    command "sleep 5"
    not_if "defaults read \"com.apple.Terminal\" \"Default Window Settings\" | grep ^#{node["osxdefaults"]["terminal"]["profile"]}$", :user => node['current_user']
end

osxdefaults_defaults "Default Window Settings" do
  domain 'com.apple.Terminal'
  key 'Default Window Settings'
  string node["osxdefaults"]["terminal"]["profile"]
  not_if "defaults read \"com.apple.Terminal\" \"Default Window Settings\" | grep ^#{node["osxdefaults"]["terminal"]["profile"]}$", :user => node['current_user']
end

osxdefaults_defaults "Startup Window Settings" do
  domain 'com.apple.Terminal'
  key 'Startup Window Settings'
  string node["osxdefaults"]["terminal"]["profile"]
  not_if "defaults read \"com.apple.Terminal\" \"Startup Window Settings\" | grep ^#{node["osxdefaults"]["terminal"]["profile"]}$", :user => node['current_user']
end
