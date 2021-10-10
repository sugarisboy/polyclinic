# frozen_string_literal: true

# Patient
class Patient
  attr_reader :fio, :gender

  def initialize(fio, gender)
    @fio = fio.strip
    @gender = gender
  end

  def to_s
    format(
      'Patient[' \
      'fio=%s;' \
      'gender=%s' \
      ']',
      fio, gender
    )
  end
end
