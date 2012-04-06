module ProcessCommand

  module Signal

    class Command

      def self.i2s(command)
        command.to_s(16).scan(/.{2}/).map{|c| c.to_i(16).chr}.join
      end

      def self.s2i(command)
        command.to_s.each_char.map{|c| c.ord.to_s(16)}.join.to_i(16)
      end

    end

  end

end

