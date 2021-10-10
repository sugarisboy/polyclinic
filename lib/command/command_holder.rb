# frozen_string_literal: true

# Command holder
class CommandHolder
  def initialize
    @commands = []
  end

  def add_command(command)
    msg = 'Can\'t push command to holder if it is not instance of Command'
    raise TypeError, msg if !command.is_a? Command

    numeric_code_new_command = command.numeric_code
    created_with_code = @commands.filter do |cmd|
      cmd.numeric_code == numeric_code_new_command
    end
    prevent_create_new = !created_with_code.empty?

    msg = 'Command with numeric code %d already exist'
    raise ArgumentError, format(msg, numeric_code_new_command) if
      prevent_create_new

    @commands << command
  end

  def find_by_numeric_code(numeric_code)
    @commands.filter { |command| command.numeric_code == numeric_code }.first
  end

  def numeric_codes
    @commands.map(&:numeric_code)
  end
end
