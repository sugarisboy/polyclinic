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

    by_end_year = as_hash_by_end_year(periods)
    avg2020 = avg_period(by_end_year[2020])
    avg2021 = avg_period(by_end_year[2021])

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

  def as_hash_by_end_year(periods)
    hash = Hash.new { |h, key| h[key] = [] }

    periods.each do |period|
      hash[period.finish.year] << period
    end

    hash
  end

  def avg_period(periods)
    avg(periods.map(&:days_count))
  end

  def avg(ints)
    count = ints.length
    count.zero? ? 0 : ints.sum / ints.length.to_f
  end
end
