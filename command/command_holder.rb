class CommandHolder

  def initialize
    @commands = []
  end

  def add_command(command)
    raise TypeError, "Can't push command to holder if it is not instance of Command" unless command.is_a? Command

    numeric_code_new_command = command.numeric_code

    raise ArgumentError, format("Command with numeric code %d already exist", numeric_code_new_command) if
      @commands.filter { |command| command.numeric_code == numeric_code_new_command }.length != 0

    @commands << command
  end

  def find_by_numeric_code(numeric_code)
    @commands.filter { |command| command.numeric_code == numeric_code }.first
  end

  def numeric_codes
    @commands.map {|element| element.numeric_code}
  end
end
