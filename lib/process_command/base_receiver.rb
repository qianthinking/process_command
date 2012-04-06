module ProcessCommand

  class BaseReceiver


    class << self

      def init
        init_listener
        Thread.new do
          init_handler
        end
      end

      def add_command_block(command, block)
        @command_blocks ||= {}
        @command_blocks[command.to_s] = block
      end

      def run_command_block(command)
        command = command.to_s
        block = @command_blocks[command]
        if block
          Thread.new do
            begin
              block.call
            rescue Exception => e
              ProcessCommand.logger.error "block execute error for command (#{command}), error: #{e.message}"
            end
          end
        else
          ProcessCommand.logger.error "block not found for command (#{command})"
        end
      end

    end

  end

end
