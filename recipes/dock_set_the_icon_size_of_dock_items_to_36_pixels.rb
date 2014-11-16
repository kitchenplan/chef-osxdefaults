tilesize = (node.key?('osxdefaults') && node['osxdefaults'].key?('dock') && node['osxdefaults']['dock'].key?('tilesize')) ? node['osxdefaults']['dock']['tilesize'] : 36
osxdefaults_defaults "Set the icon size of Dock items to #{tilesize} pixels" do
  domain 'com.apple.dock'
  key 'tilesize'
  integer tilesize
end
