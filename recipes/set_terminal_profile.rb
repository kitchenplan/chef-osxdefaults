template "#{Chef::Config[:file_cache_path]}/TomorrowNightEighties.terminal" do
    source "TomorrowNightEighties.terminal"
    owner node['current_user']
    mode "0755"
end

execute "Load the terminal theme" do
    command "open #{Chef::Config[:file_cache_path]}/TomorrowNightEighties.terminal"
end

execute "Wait a while" do
    command "sleep 5"
end

osxdefaults_defaults "Default Window Settings" do
  domain 'com.apple.Terminal'
  key 'Default Window Settings'
  string 'TomorrowNightEighties'
end

osxdefaults_defaults "Startup Window Settings" do
  domain 'com.apple.Terminal'
  key 'Startup Window Settings'
  string 'TomorrowNightEighties'
end


