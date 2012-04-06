module ProcessCommand

  class Logger

    class << self

      def info(message)
        p "INFO: #{message}"
      end

      def error(message)
        p "ERROR: #{message}"
      end

    end

  end

end
