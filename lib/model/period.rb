# frozen_string_literal: true

# Period
class Period
  DATE_FORMAT_STR = '%Y-%m-%d'

  attr_reader :start, :finish

  def initialize(start, finish)
    @start = start
    @finish = finish
  end

  def start_to_s
    time_to_s(start)
  end

  def finish_to_s
    time_to_s(finish)
  end

  def to_s
    "Period[start=#{start_to_s};finish=#{finish_to_s};duration=#{days_count}]"
  end

  def end_year?(year)
    finish.year == year
  end

  def days_count
    (finish - start).round(half: :down) + 1
  end

  private

  def time_to_s(time)
    time.strftime(DATE_FORMAT_STR)
  end
end
