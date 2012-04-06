# ProcessCommand

Interprocess communication with command for ruby

## Usage

    #in receiver process(pid: 9999)
    require 'process_command'
    ProcessCommand.init_receiver
    ProcessCommand.on(:pause) { p "server paused" }
    ProcessCommand.on(:resume) { p "server resumed" }

    #in sender process
    require 'process_command'
    ProcessCommand.send :pause, 9999

## Mode

* Unix socket (default)

    ProcessCommand.mode = :socket

* Signal

    ProcessCommand.mode = :signal

## Customization

For logger

    ProcessCommand.logger = ProcessCommand::Logger

For mode socket, default path /tmp, you can change it

    ProcessCommand::Socket::Setting.set_path(path)

For mode signal, default signals are USR1, USR2, HUP, you can change them both in sender and receiver

    ProcessCommand::Signal::Setting.set_bits(bit0_signal, bit1_signal)
    ProcessCommand::Signal::Setting.set_control(control_signal)
