# frozen_string_literal: true

require 'date'
require 'singleton'

require_relative 'utils/io_utils'
require_relative 'reader/model_reader'
require_relative 'command/command_holder'
require_relative 'command/command_end_session'
require_relative 'command/command_sick_list_periods'
require_relative 'command/command_list_doctors'
require_relative 'command/command_count_patients'
require_relative 'command/command_max_min_sick_list'
require_relative 'command/command_random_patient'
require_relative 'utils/gui'

# Main module for this Application
# Help you analyze data from polyclinic
class Analyzer
  include Singleton

  def init
    @data = load_data
    @command_holder = config_command_holder
    to_user_control
  end

  def load_data
    puts IOUtils.colored('Загрузка данных начата')
    data = ModelReader.read
    puts IOUtils.colored("Загрузка данных окончена\n")
    data
  end

  def config_command_holder
    commands = [
      CommandRandomPatient.instance,
      CommandListDoctors.instance,
      CommandCountPatients.instance,
      CommandSickListPeriods.instance,
      CommandMaxMinSickList.instance,
      CommandEndSession.instance
    ]

    command_holder = CommandHolder.new
    command_holder.add_commands(commands)
    command_holder
  end

  def to_user_control
    commands_info = @command_holder.command_info
    codes = @command_holder.numeric_codes

    loop do
      Gui.print_welcome(commands_info)
      listened_numeric_code = Gui.listen_command_code(codes)

      break if listened_numeric_code.nil?

      command = @command_holder.find_by_numeric_code(listened_numeric_code)
      command.execute(@data)

      break if command.end_session?
    end
  end
end
