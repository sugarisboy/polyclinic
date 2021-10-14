# frozen_string_literal: true

# Class for work with array sick list
class SickLists
  def initialize(arr = [])
    @set = arr
  end

  def push(sick_list)
    @set.push(sick_list)
  end

  def patients_count
    @set.length
  end

  def patients_male_count
    count_male = @set.map(&:patient)
                     .map(&:gender)
                     .filter(&:male?)
                     .length
    patients_count - count_male
  end

  def patients_female_count
    count_female = @set.map(&:patient)
                       .map(&:gender)
                       .filter(&:female?)
                       .length
    patients_count - count_female
  end

  def doctors
    @set.map(&:doctor).uniq.sort
  end

  def patient_max_min_period
    duration_hash = data_as_hash_with_duration(@set)
    sorted_keys = duration_hash.keys.sort

    max = find_with_max_num(duration_hash[sorted_keys[0]])
    min = find_with_max_num(duration_hash[sorted_keys[-1]])

    [max, min].freeze
  end

  def random
    @set.sample
  end

  def avg_periods
    periods = @set.map(&:period)
    avg_period(periods)
  end

  def avg_year_periods(year)
    periods = @set.map(&:period)
    by_end_year = as_hash_by_end_year(periods)
    avg_period(by_end_year[year])
  end

  private

  def data_as_hash_with_duration(data)
    diff = Hash.new { |hash, key| hash[key] = [] } # https://ruby-doc.org/core-3.0.2/Hash.html#method-c-new

    data.each do |list|
      arr = diff[list.period.days_count.to_i]
      arr.push(list)
    end

    diff
  end

  def find_with_max_num(arr)
    arr.max_by(&:num)
  end

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
