module ProcessCommand

  module Signal

    class Sender

      SENDER_LOCK = Mutex.new
      DEFAULT_DELAY = 0.05

      class << self

        def set_delay(delay)
          @delay = delay
        end

        def send(command, pid)
          @delay ||= DEFAULT_DELAY
          command = Command.s2i(command).to_s(2)
          return if command.empty?
          SENDER_LOCK.synchronize do
            while bit = command.slice!(0)
              signal = bit == '0' ? Setting.bit0 : Setting.bit1
              Process.kill(signal, pid)
              sleep @delay
            end
            Process.kill(Setting.control, pid)
          end
        end


      end

    end

  end

end
