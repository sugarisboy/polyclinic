# frozen_string_literal: true

require 'singleton'
require_relative '../command/Command'

# Command max/min sick list info
class CommandMaxMinSickList < Command
  include Singleton

  def initialize
    super
    @numeric_code = 5
    @name = 'Максимальный и минимальный больничный'
  end

  def execute(data)
    diff_hash = list_as_hash_with_duration(data)
    sorted_keys = diff_hash.keys.sort

    min = find_with_max_num(diff_hash[sorted_keys[0]])
    max = find_with_max_num(diff_hash[sorted_keys[-1]])

    puts min.info
    puts max.info
  end

  private

  def list_as_hash_with_duration(data)
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
end
