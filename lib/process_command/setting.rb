module ProcessCommand

  class Setting

    DEFAULT_BIT0 = :USR1
    DEFAULT_BIT1 = :USR2
    DEFAULT_STOP = :HUP

    class << self

      def set_bit_signals(bit0, bit1)
        @bit0 = bit0
        @bit1 = bit1
      end

      def set_stop_signal(stop)
        @stop = stop
      end

      def bit0
        @bit0 ||= DEFAULT_BIT0
      end

      def bit1
        @bit1 ||= DEFAULT_BIT1
      end

      def stop
        @stop ||= DEFAULT_STOP
      end

    end

  end

end

