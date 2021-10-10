# frozen_string_literal: true

# Sick list
class SickList
  attr_reader :num, :patient, :period, :diagnosis, :doctor

  def initialize(num, patient, period, diagnosis, doctor)
    @num = num.strip
    @patient = patient
    @period = period
    @diagnosis = diagnosis
    @doctor = doctor.strip
  end

  def to_s
    format(
      'SickList[' \
      'num=%s;' \
      'patient=%s;'\
      'diagnosis=%s;'\
      'period=%s;'\
      'doctor=%s'\
      ']',
      num, patient, diagnosis, period, doctor
    )
  end

  def info
    format(
      '%s не %s возможности посещать свое рабочее место в период с' \
      ' %s по %s по причине %s, код листа нетрудоспособности %s',
      patient.fio,
      patient.gender.male? ? 'имел' : 'имела',
      period.start_to_s,
      period.finish_to_s,
      diagnosis,
      num
    )
  end
end
