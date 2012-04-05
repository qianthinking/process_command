require 'process_command/helper'
require 'process_command/setting'
require 'process_command/receiver'
require 'process_command/sender'

module ProcessCommand

  #for receiver
  def self.on(command, &block)
    ProcessCommand::Receiver.add_command_block command, block
  end

  #for sender
  def self.send(command, pid)
    ProcessCommand::Sender.send(command, pid)
  end

end

