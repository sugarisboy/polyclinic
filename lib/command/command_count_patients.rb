# frozen_string_literal: true

require 'singleton'
require_relative '../command/Command'

# Command count patients info
class CommandCountPatients < Command
  include Singleton

  def initialize
    super
    @numeric_code = 3
    @name = 'Количество пациентов'
  end

  def execute(lists)
    print(
      "Всего пациентов: #{lists.patients_count}\n" \
      "Пациентов мужчин: #{lists.patients_male_count}\n" \
      "Пациентов женщин: #{lists.patients_female_count}\n"
    )
  end
end
