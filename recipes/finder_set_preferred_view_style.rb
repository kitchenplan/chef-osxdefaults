osxdefaults_defaults "Update Finder windows to use by default" do
  domain 'com.apple.finder'
  key 'FXPreferredViewStyle'
  string node['osxdefaults']['finder']['preferred_view_style']
end
