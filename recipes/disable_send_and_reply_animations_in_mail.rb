osx-defaults_defaults "Disable reply animations in Mail.app" do
  domain 'com.apple.mail'
  key 'DisableReplyAnimations'
  boolean true
end

osx-defaults_defaults "Disable send animations in Mail.app" do
  domain 'com.apple.mail'
  key 'DisableSendAnimations'
  boolean true
end
