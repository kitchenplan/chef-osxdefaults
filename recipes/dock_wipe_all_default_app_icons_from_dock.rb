execute "Wipe all (default) app icons from  Dock" do
  command "sudo -u #{node['current_user']} defaults write 'com.apple.dock' persistent-apps -array ''"
end
