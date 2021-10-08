class Command

  attr_reader :numeric_code

  def initialize(numeric_code)
    @numeric_code = numeric_code
  end

  # @abstract
  def execute(data)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
