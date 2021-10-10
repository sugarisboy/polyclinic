# frozen_string_literal: true

# Command
class Command
  attr_reader :numeric_code

  # @abstract
  def execute(_data)
    msg = "#{self.class} has not implemented method '#{__method__}'"
    raise NotImplementedError, msg
  end
end
