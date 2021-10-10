# frozen_string_literal: true

# Gender
class Gender
  def initialize(code, str)
    @code = code
    @str = str
  end

  def to_s
    @str
  end

  def self.value_of(char)
    char = char.downcase.strip

    case char
    when 'м'
      Male
    when 'ж'
      Female
    else
      raise ArgumentError 'Not valid symbol of sex = '.concat(char)
    end
  end

  def male?
    self == Male
  end

  def female?
    self == Female
  end

  Male = new(0, 'Муж')
  Female = new(1, 'Жен')

  private_class_method :new
end
