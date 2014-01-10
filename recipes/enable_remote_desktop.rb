execute "enable Remote Desktop" do
  command "sudo #{node['osxdefaults']['remote_desktop_path']} #{node['osxdefaults']['remote_desktop_config']}"
end
