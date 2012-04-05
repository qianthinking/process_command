module ProcessCommand

  class Sender

    SENDER_LOCK = Mutex.new
    DEFAULT_DELAY = 0.01

    class << self
      
      def set_delay(delay)
        @delay = delay
      end

      def send(command, pid)
        @delay ||= DEFAULT_DELAY
        command = ProcessCommand.s2i(command).to_s(2)
        return if command.empty?
        SENDER_LOCK.synchronize do
          while bit = command.slice!(0)
            signal = bit == '0' ? ProcessCommand::Setting.bit0 : ProcessCommand::Setting.bit1
            Process.kill(signal, pid)
            sleep @delay
          end
          Process.kill(ProcessCommand::Setting.stop, pid)
        end
      end

    end

  end

end
