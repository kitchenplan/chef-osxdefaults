# Do this by hand because the provider does not use sudo by default -- this is a system level property
# that requires sudo to modify.
execute "Display login window as name and password - com.apple.loginwindow.plist - SHOWFULLNAME" do
  command "sudo defaults write /Library/Preferences/com.apple.loginwindow.plist SHOWFULLNAME -bool true"
end
