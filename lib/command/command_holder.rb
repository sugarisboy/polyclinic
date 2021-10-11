# frozen_string_literal: true

# Command holder
class CommandHolder
  CANT_ADD_CMD_ERROR = 'Can\'t push command to holder if ' \
                       'it is not instance of Command'
  NUMERIC_CODE_ALREADY_EXIST_ERROR = 'Command with numeric ' \
                                     'code %d already exist'

  def initialize
    @commands = []
  end

  def add_commands(commands)
    commands.each { |cmd| add_command(cmd) }
  end

  def add_command(command)
    raise TypeError, CANT_ADD_CMD_ERROR if !command.is_a? Command

    code = command.numeric_code
    already_exist = exist?(code)

    msg = format(NUMERIC_CODE_ALREADY_EXIST_ERROR, code)
    raise ArgumentError, msg if already_exist

    @commands << command
  end

  def exist?(code)
    by_code = @commands.filter { |cmd| cmd.numeric_code == code }
    !by_code.empty?
  end

  def find_by_numeric_code(numeric_code)
    @commands.find { |command| command.numeric_code == numeric_code }
  end

  def numeric_codes
    @commands.map(&:numeric_code)
  end

  def command_info
    @commands.map do |command|
      code = command.numeric_code
      name = command.name
      format(
        '  %<code>d. %<name>s',
        {
          code: code,
          name: name
        }
      )
    end.join("\n")
  end
end
