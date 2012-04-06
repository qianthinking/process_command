require 'socket'
module ProcessCommand

  module Socket

    class Receiver < ProcessCommand::BaseReceiver

      class << self

        RECEIVER_QUEUE = Queue.new

        def init_listener
          path = Setting.socket_path Process.pid
          File.delete path if File.exists? path
          @server = UNIXServer.new path
        end

        def init_handler
          while client = @server.accept
            Thread.new do
              command = client.read
              run_command_block command
            end
          end
        end

      end

    end

  end

end
