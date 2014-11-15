tilesize = (node.key?('dock') && node['dock'].key?('tilesize')) ? node['dock']['tilesize'] : 24
osxdefaults_defaults "Set the icon size of Dock items to #{tilesize} pixels" do
  domain 'com.apple.dock'
  key 'tilesize'
  integer tilesize
end

