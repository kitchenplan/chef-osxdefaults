osxdefaults_defaults "Mail.app: Check for new messages" do
  domain 'com.apple.mail'
  key 'PollTime'
  integer node["dotfiles"]["mail"]["polltime"]
end
