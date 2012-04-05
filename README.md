# ProcessCommand

Communication with command between processes.

## Usage

* in receiver process(pid: 9999)

    require 'process_command'
    ProcessCommand::Receiver.init
    ProcessCommand.on(:ok) {p "ok"}

* in sender process

    require 'process_command'
    ProcessCommand.send :ok, 9999

## Customization

Default use signals USR1, USR2, HUP, you can customize them both in sender and receiver

    ProcessCommand::Setting.set_bit_signals(bit0_signal, bit1_signal)
    ProcessCommand::Setting.set_stop_signal(stop_signal)
