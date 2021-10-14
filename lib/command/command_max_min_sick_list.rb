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

  def execute(lists)
    lists.patient_max_min_period.each { |list| puts info(list) }
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
