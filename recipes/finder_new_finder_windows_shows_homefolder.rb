osxdefaults_defaults "Finder: New Finder window shows the homefolder 1/2" do
  domain 'com.apple.finder'
  key 'NewWindowTarget'
  string "PfHm"
end

osxdefaults_defaults "Finder: New Finder window shows the homefolder 1/2" do
  domain 'com.apple.finder'
  key 'NewWindowTargetPath'
  string "file://localhost/Users/#{node['current_user']}/"
end
