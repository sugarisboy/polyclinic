class Period

  Date_format_str = "%Y-%m-%d"

  private_class_method :time_to_s
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

  def time_to_s(time)
    time.strftime(Date_format_str)
  end

  def to_s
    format("с %s по %s", start_to_s, finish_to_s)
  end
end