# frozen_string_literal: true

require 'singleton'
require_relative '../command/Command'

# Command random patient info
class CommandRandomPatient < Command
  include Singleton

  def initialize
    super
    @numeric_code = 1
    @name = 'Случайный пациент'
  end

  def execute(data)
    puts info(data.sample)
  end

  def info(sick_list)
    fio = sick_list.patient.fio
    gender = sick_list.patient.gender
    per = sick_list.period
    diagnosis = sick_list.diagnosis
    num = sick_list.num

    "#{fio} не имел#{gender.male? ? '' : 'а'} возможности посещать свое " \
      "рабочее место в период с #{per.start_to_s} по #{per.finish_to_s} " \
      "по причине #{diagnosis}, код листа нетрудоспособности #{num}." \
  end
end
