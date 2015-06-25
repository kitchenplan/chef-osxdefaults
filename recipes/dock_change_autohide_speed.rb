autohidespeed = (node.key?('osxdefaults') && node['osxdefaults'].key?('dock') && node['osxdefaults']['dock'].key?('autohidespeed')) ? node['osxdefaults']['dock']['autohidespeed'] : 0.4
osxdefaults_defaults "Modify the animation speed when hiding/showing the dock" do
  domain 'com.apple.dock'
  key 'autohide-time-modifier'
  float autohidespeed
end
