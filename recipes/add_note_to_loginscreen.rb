osxdefaults_defaults "Add a note to the loginscreen" do
  domain 'com.apple.loginwindow.plist'
  key 'LoginwindowText'
  string node['osxdefaults']['loginmessage']
end
