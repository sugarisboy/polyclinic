# frozen_string_literal: true

# Sick list
class SickList
  attr_reader :num, :patient, :period, :diagnosis, :doctor

  def initialize(num, patient, period, diagnosis, doctor)
    @num = num
    @patient = patient
    @period = period
    @diagnosis = diagnosis
    @doctor = doctor
  end

  def to_s
    "SickList[num=#{num};patient=#{patient};diagnosis=#{diagnosis};" \
      "period=#{period};#doctor=#{doctor}]"
  end
end
