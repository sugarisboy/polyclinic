require_relative 'command'

class CommandRandomPatient < Command
  #- SINGLETON -#

  @instance = new(1)

  private_class_method :new

  def self.instance
    @instance
  end

  #- BUSINESS LOGIC -#

  def execute(data)
    puts data.sample.info
  end
end
