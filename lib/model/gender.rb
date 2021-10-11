# frozen_string_literal: true

# Gender
class Gender
  private_class_method :new

  def initialize(code, name)
    @code = code
    @name = name
  end

  def to_s
    @name
  end

  def male?
    self == INSTANCES[:male]
  end

  def female?
    self == INSTANCES[:female]
  end

  INSTANCES = {
    male: new(0, 'Муж'),
    female: new(1, 'Жен')
  }.freeze
end
