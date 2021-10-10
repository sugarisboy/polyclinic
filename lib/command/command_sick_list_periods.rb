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

  def execute(data)
    periods = data.map(&:period)

    avg_periods = avg_period(periods)
    avg2020 = avg_period(select_year(periods, 2020))
    avg2021 = avg_period(select_year(periods, 2021))

    printf(
      "Средняя продолжительность больничного: %<all>.2f суток\n" \
      " - 2020: %<avg2020>.2f суток\n" \
      " - 2021: %<avg2021>.2f суток\n",
      {
        all: avg_periods,
        avg2020: avg2020,
        avg2021: avg2021
      }
    )
  end

  private

  def select_year(periods, year)
    periods.select { |period| period.end_year?(year) }
  end

  def avg_period(periods)
    avg(periods.map(&:days_count))
  end

  def avg(ints)
    count = ints.length
    count.zero? ? 0 : ints.sum / ints.length.to_f
  end
end
