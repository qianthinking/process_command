module ProcessCommand

  module Signal

    class Setting

      DEFAULT_BIT0 = :USR1
      DEFAULT_BIT1 = :USR2
      DEFAULT_CONTROL = :HUP

      class << self

        def set_bits(bit0, bit1)
          @bit0 = bit0
          @bit1 = bit1
        end

        def set_control(control)
          @control = control
        end

        def bit0
          @bit0 ||= DEFAULT_BIT0
        end

        def bit1
          @bit1 ||= DEFAULT_BIT1
        end

        def control
          @control ||= DEFAULT_CONTROL
        end

      end

    end

  end

end

