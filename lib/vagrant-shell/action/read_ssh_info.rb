require "log4r"

module VagrantPlugins
  module Shell
    module Action
      # This action reads the SSH info for the machine and puts it into the
      # `:machine_ssh_info` key in the environment.
      class ReadSSHInfo
        def initialize(app, env)
          @app    = app
          @logger = Log4r::Logger.new("vagrant_shell::action::read_ssh_info")
        end

        def call(env)
          env[:machine_ssh_info] = read_ssh_info(env[:machine])

          @app.call(env)
        end

        def read_ssh_info(machine)
          return nil if machine.id.nil?

          # Read the DNS info
          host,port = `#{machine.config[:script]} ssh-info #{machine.id}`.split(/\s+/)[0,2]
          return {
            :host => host,
            :port => port
          }
        end
      end
    end
  end
end