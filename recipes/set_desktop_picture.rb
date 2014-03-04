require 'uri'

version  = Helpers.version
destDir  = File.join(ENV["HOME"], "/Library/Desktop Pictures")
image    = node['osxdefaults']['desktop_picture']

if image

  isRemote  = ( image =~ /^#{URI::regexp}$/ )
  extension = ( !isRemote ? File.extname(image) : File.extname(URI.parse(image).path) )[/.+/m] || ".png"
  destFile  = "#{destDir}/kitchenplan#{extension}"

  unless File.exists?(destFile)

    name = "Set desktop picture"

    # create picture directory

    directory destDir do
      owner node['current_user']
      action :create
    end if !File.directory?(destDir)

    # default arguments

    args = Proc.new {

      path destFile

      if !isRemote
        content ::File.open(image).read
      else
        source image
      end

      owner node['current_user']

    }

    # save file

    ( isRemote ? remote_file(name, &args) : file(name, &args) )

    if version > "10.8"

      # http://1klb.com/blog/desktop-background-on-os-x-109-mavericks.html

      db  = File.join(ENV["HOME"], "Library/Application\\ Support/Dock/desktoppicture.db")
      cmd = "\"update data set value = '#{destFile}'\""
      cmd = "sqlite3 #{db} #{cmd};"
    else

      # https://gist.github.com/willurd/5829224

      cmd = "defaults write com.apple.desktop Background \"{default = {ImageFilePath='#{destFile}'; };}\""
    end

    execute "Set default desktop picture"  do
      command cmd
    end

  end

end
