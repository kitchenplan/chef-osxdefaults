# Do this by hand because the provider does not handle spaces in the value well
execute "Add a note to the loginscreen - com.apple.loginwindow.plist - LoginwindowText"  do
    command "defaults write \"/Library/Preferences/com.apple.loginwindow.plist\" \"LoginwindowText\" -string \"#{node['osxdefaults']['loginmessage']}\""
end
