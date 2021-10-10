# frozen_string_literal: true

require 'singleton'
require_relative '../command/Command'

# Command random patient info
class CommandRandomPatient < Command
  include Singleton

  def initialize
    super
    @numeric_code = 1
  end

  def execute(data)
    puts data.sample
    puts data.sample.info
  end
end