# frozen_string_literal: true

# Diagnosis
class Diagnosis
  private_class_method :new
  attr_reader :code

  def initialize(code, name)
    @code = code
    @name = name
  end

  def to_s
    @name
  end

  def self.value_of(code)
    INSTANCES[code]
  end

  INSTANCES = {
    1 => new(1, 'Заболевание'),
    2 => new(2, 'Травма'),
    3 => new(3, 'Карантин'),
    4 => new(4, 'Несчастный случай на производстве или его последствия'),
    5 => new(5, 'Отпуск по беременности и родам'),
    6 => new(6, 'Протезирование в стационаре'),
    7 => new(7, 'Профессиональное заболевание или его обострение'),
    8 => new(8, 'Долечивание в санатории'),
    9 => new(9, 'Уход за больным членом семьи'),
    10 => new(10, 'Иное состояние (отравление, проведение манипуляций и др.)')
  }.freeze
end
