# frozen_string_literal: true

require_relative 'io_utils'

# Module for work with GUI
module Gui
  WELCOME = "Добро пожаловать в анализитор больничных листов.\n" \
            "Выберите необходимую услугу из следующего списка и\n" \
            "введите номер необходимой услуги:\n" \
            "\n%<commands_info>s\n\n" \
            'Воспользоваться услугой №:'

  UNDEFINED_COMMAND = 'Данная команда не распознана, повторите ввод:'
  COMMAND_NOT_FOUND = 'Команда №%d не найдена, повторите ввод:'

  def self.print_welcome(commands_info)
    msg = format(WELCOME, commands_info: commands_info)
    print IOUtils.colored(msg)
  end

  def self.listen_command_code(success_codes)
    answer = gets

    return if answer.nil?

    answer = answer.to_i

    if answer.zero?
      print UNDEFINED_COMMAND
      return listen_command_code(success_codes)
    end

    if !success_codes.include?(answer)
      printf(COMMAND_NOT_FOUND, answer)
      return listen_command_code(success_codes)
    end

    answer
  end
end
