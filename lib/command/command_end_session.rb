# frozen_string_literal: true

require 'singleton'
require_relative '../command/Command'

# Command end session
class CommandEndSession < Command
  include Singleton

  def initialize
    super
    @numeric_code = 6
    @name = 'Завершить работу'
  end

  def execute(_) end

  def end_session?
    true
  end
end
