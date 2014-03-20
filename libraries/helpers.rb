module Helpers

    def self.version

        cmd = Mixlib::ShellOut.new('/usr/bin/sw_vers -productVersion')
        cmd.run_command

        result = cmd.stdout
        version ||= result.chomp[/10\.\d+/]

    end

end