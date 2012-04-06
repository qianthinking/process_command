require 'socket'
module ProcessCommand

  module Socket

    class Sender

      class << self

        def send(command, pid)
          command = command.to_s
          path = Setting.socket_path pid
          server = UNIXSocket.new path
          server.write command
          server.close
        rescue Exception => e
          ProcessCommand.logger.error "send error, #{e.message}"
        end

      end

    end

  end

end
