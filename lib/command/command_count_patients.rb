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

  def execute(data)
    count = data.length

    count_male = data.map(&:patient).map(&:gender).filter(&:male?).length

    count_female = count - count_male

    printf(
      "Всего пациентов: %<all>d\n" \
      "Пациентов мужчин: %<male>d\n" \
      "Пациентов женщин: %<female>d\n",
      {
        all: count,
        male: count_male,
        female: count_female
      }
    )
  end
end
