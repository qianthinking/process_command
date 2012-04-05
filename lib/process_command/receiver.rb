module ProcessCommand

  class Receiver

    class << self

      attr_accessor :command
      attr_reader :command_blocks
      RECEIVER_QUEUE = Queue.new

      def init
        @command = 0
        @command_blocks = {}
        Signal.trap(ProcessCommand::Setting.bit0) do
          Thread.new{ RECEIVER_QUEUE << 0}
        end
        Signal.trap(ProcessCommand::Setting.bit1) do
          Thread.new{ RECEIVER_QUEUE << 1}
        end
        Signal.trap(ProcessCommand::Setting.stop) do
          Thread.new{ RECEIVER_QUEUE << :stop}
        end
        Thread.new do
          while value = RECEIVER_QUEUE.pop
            command = ProcessCommand::Receiver.command
            case value
            when 0
              command <<= 1
            when 1
              command <<= 1
              command |= 1
            when :stop
              run_command_block command if command
              command = 0
            else
              log "illegal value #{value}, reset command 0"
              command = 0
            end
            ProcessCommand::Receiver.command = command
          end
        end
      end

      def add_command_block(command, block)
        @command_blocks[ProcessCommand.s2i(command)] = block
      end

      def run_command_block(command)
        block = @command_blocks[command]
        if block
          Thread.new do
            begin
              block.call
            rescue Exception => e
              log "block execute error for command #{ProcessCommand.i2s(command)}(#{command}), error: #{e.message}", e
            end
          end
        else
          log "block not found for command #{ProcessCommand.i2s(command)}(#{command})"
        end
      end

      def log(message, e=nil)
        p message
      end

    end

  end

end
