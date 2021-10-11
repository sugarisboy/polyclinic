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
    duration_hash = data_as_hash_with_duration(data)
    sorted_keys = duration_hash.keys.sort

    [
      find_with_max_num(duration_hash[sorted_keys[0]]),
      find_with_max_num(duration_hash[sorted_keys[-1]])
    ].each { |list| puts info(list) }
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
    arr.max_by { |list| list.diagnosis.code }
  end

  def info(sick_list)
    fio = sick_list.patient.fio
    gender = sick_list.patient.gender
    per = sick_list.period
    diagnosis = sick_list.diagnosis
    num = sick_list.num

    "#{fio} не имел#{gender.male? ? '' : 'а'} возможности посещать свое " \
      "рабочее место в период с #{per.start_to_s} по #{per.finish_to_s} " \
      "по причине #{diagnosis}, код листа нетрудоспособности #{num}. " \
      "Всего срок больничного составил #{per.days_count} суток"
  end
end
