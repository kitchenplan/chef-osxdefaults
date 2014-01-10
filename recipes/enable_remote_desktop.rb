execute "enable Remote Desktop" do
    command "kickstart #{node['osxdefaults']['remote_desktop_command']}"
end
