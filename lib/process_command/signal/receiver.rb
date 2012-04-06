module ProcessCommand

  module Signal

    class Receiver < ProcessCommand::BaseReceiver

      class << self

        attr_accessor :command
        RECEIVER_QUEUE = Queue.new

        def init
          @command = 0
          super
        end

        def init_listener
          ::Signal.trap(Setting.bit0) do
            Thread.new{ RECEIVER_QUEUE << 0}
          end
          ::Signal.trap(Setting.bit1) do
            Thread.new{ RECEIVER_QUEUE << 1}
          end
          ::Signal.trap(Setting.control) do
            Thread.new{ RECEIVER_QUEUE << :control}
          end
        end

        def init_handler
          while value = RECEIVER_QUEUE.pop
            command = Receiver.command
            case value
            when 0
              command <<= 1
            when 1
              command <<= 1
              command |= 1
            when :control
              run_command_block Command.i2s(command) if command
              command = 0
            else
              ProcessCommand.logger.error "illegal value #{value}, reset command 0"
              command = 0
            end
            self.command = command
          end
        end

      end

    end

  end

end
