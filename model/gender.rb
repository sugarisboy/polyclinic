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
    if char == "м"
      Male
    elsif char == "ж"
      Female
    else
      raise ArgumentError "Not valid symbol of sex = " + char
    end
  end

  def is_male?
    self == Male
  end

  def is_female?
    self == Female
  end

  Male = new(0, "Муж")
  Female = new(1, "Жен")

  private_class_method :new

end
