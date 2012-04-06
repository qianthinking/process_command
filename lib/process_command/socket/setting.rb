module ProcessCommand

  module Socket

    class Setting

      DEFAULT_PATH = "/tmp"

      class << self

        def set_path(path)
          @path = path
        end

        def path
          @path ||= DEFAULT_PATH
        end

        def socket_path(pid)
          "#{self.path}/process_command_#{pid}.sock"
        end


      end

    end

  end

end

