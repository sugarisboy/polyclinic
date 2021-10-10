# frozen_string_literal: true

# Period
class Period
  DATE_FORMAT_STR = '%Y-%m-%d'

  def time_to_s(time)
    time.strftime(DATE_FORMAT_STR)
  end

  private :time_to_s
  attr_reader :start, :finish

  def initialize(start, finish)
    @start = start
    @finish = finish
  end

  def start_to_s
    time_to_s start
  end

  def finish_to_s
    time_to_s finish
  end

  def to_s
    start = start_to_s
    finish = finish_to_s
    format('Period[start=%s;finish=%s]', start, finish)
  end
end
