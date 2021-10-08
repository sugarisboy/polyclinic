class SickList

  attr_reader :num, :fio, :gender, :period, :diagnosis, :doctor

  def initialize(num, fio, gender, period, diagnosis, doctor)
    @num = num.strip
    @fio = fio.strip
    @gender = gender
    @period = period
    @diagnosis = diagnosis
    @doctor = doctor.strip
  end

  def to_s
    format("SickList[num=%s;fio=%s;gender=%s;diagnosis=%s;period=%s;doctor=%s]",
           num, fio, gender, diagnosis, period, doctor)
  end

  def info
    format(
      "%s не %s возможности посещать свое рабочее место в период с" +
        " %s по %s по причине \"%s\", код листа нетрудоспособности %s",
      fio,
      gender.is_male? ? "имел" : "имела",
      period.start_to_s,
      period.finish_to_s,
      diagnosis,
      num
    )
  end
end
