# frozen_string_literal: true

# Diagnosis
class Diagnosis
  private_class_method :new
  attr_reader :code

  def initialize(code, str)
    @code = code
    @str = str
  end

  def to_s
    @str
  end

  def self.value_of(code)
    found = INSTANCES.find do |_, value|
      value.code == code.to_i
    end
    found[1]
  end

  INSTANCES = {
    Sick: new(1, 'Заболевание'),
    Trauma: new(2, 'Травма'),
    Quarantine: new(3, 'Карантин'),
    Accident: new(4, 'Несчастный случай на производстве или его последствия'),
    Pregnancy: new(5, 'Отпуск по беременности и родам'),
    Prosthetics: new(6, 'Протезирование в стационаре'),
    Occupat_illness: new(7, 'Профессиональное заболевание или его обострение'),
    Sanatorium: new(8, 'Долечивание в санатории'),
    Nursing: new(9, 'Уход за больным членом семьи'),
    Other: new(10, 'Иное состояние (отравление, проведение манипуляций и др.)')
  }.freeze
end
