require 'process_command/base_receiver'
require 'process_command/logger'
require 'process_command/signal/command'
require 'process_command/signal/setting'
require 'process_command/signal/receiver'
require 'process_command/signal/sender'
require 'process_command/socket/setting'
require 'process_command/socket/receiver'
require 'process_command/socket/sender'
require 'active_support/core_ext/module/attribute_accessors'

module ProcessCommand

  mattr_accessor :mode
  mattr_accessor :logger

  def self.receiver
    case self.mode
    when :signal
      ProcessCommand::Signal::Receiver
    when :socket
      ProcessCommand::Socket::Receiver
    else
      nil
    end
  end

  def self.sender
    case self.mode
    when :signal
      ProcessCommand::Signal::Sender
    when :socket
      ProcessCommand::Socket::Sender
    else
      nil
    end
  end

  def self.init_receiver
    self.receiver.init
  end

  #for receiver
  def self.on(command, &block)
    self.receiver.add_command_block command, block
  end

  #for sender
  def self.send(command, pid)
    self.sender.send(command, pid)
  end

end

ProcessCommand.mode = :socket #:signal
ProcessCommand.logger = ProcessCommand::Logger

