module LibyuiTestFramework
  module Helpers
    class LocalModule

        def initialize(port:, name:)
          @port = port
          @name = name
          @app_pid = nil
        end

        def start_ncurses
          start(cmd: "xterm -e 'YUI_REUSE_PORT=1 YUI_HTTP_PORT=#{@port} yast2 #{@name} --ncurses'")
        end

        def start_qt
          start(cmd: "YUI_REUSE_PORT=1 YUI_HTTP_PORT=#{@port} yast2 #{@name} --qt")
        end

        # start the application in background
        def start(cmd:)
          YuiRestClient.logger.debug("Starting #{cmd}...")
          # create a new process group so easily we will be able
          # to kill all its sub-processes
          @app_pid = Process.spawn(cmd, pgroup: true)
          YuiRestClient.logger.debug("App started: '#{cmd}'")
          self
        end

        # kill the process if it is still running after finishing a scenario
        def kill
          return self unless @app_pid

          Process.waitpid(@app_pid, Process::WNOHANG)
          YuiRestClient.logger.debug("Sending KILL signal for PID #{@app_pid}")
          Process.kill('-KILL', @app_pid)
          self
        rescue Errno::ECHILD, Errno::ESRCH
          # the process has already exited
          @app_pid = nil
          self
        end
    end
  end
end
