# frozen_string_literal: true

require 'singleton'
require_relative '../command/Command'

# Command sick list periods info
class CommandSickListPeriods < Command
  include Singleton

  def initialize
    super
    @numeric_code = 4
    @name = 'Длительность больничного'
  end

  def execute(lists)
    printf(
      "Средняя продолжительность больничного: %<all>.2f суток\n" \
      " - 2020: %<avg2020>.2f суток\n" \
      " - 2021: %<avg2021>.2f суток\n",
      {
        all: lists.avg_periods,
        avg2020: lists.avg_year_periods(2020),
        avg2021: lists.avg_year_periods(2021)
      }
    )
  end
end
