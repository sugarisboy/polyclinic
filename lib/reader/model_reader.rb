# frozen_string_literal: true

require_relative '../model/period'
require_relative '../model/gender'
require_relative '../model/patient'
require_relative '../model/diagnosis'
require_relative '../model/sick_list'

# Module for reading models
module ModelReader
  NUM = 'Номер больничного'
  FIO = 'ФИО нетрудоспособного'
  GENDER = 'Пол'
  PERIOD = 'Период нетрудоспособности'
  DIAGNOSIS_CODE = 'Код причины нетрудоспособности'
  DOCTOR = 'Фамилия врача'

  FILE = 'polyclinic_log_lazy.csv'
  SEPARATOR = ';'

  PERIOD_NOT_VALID_FORMAT = 'Period must have format ' \
                            'YYYY-MM-DD - YYYY-MM-DD format'

  def self.read
    csv_data = IOUtils.read_csv(FILE, SEPARATOR)

    csv_data.map do |row|
      period = parse_period(row)
      diagnosis = parse_diagnosis(row)
      patient = parse_patient(row)

      SickList.new(
        row[NUM],
        patient,
        period,
        diagnosis,
        row[DOCTOR]
      )
    end
  end

  def self.parse_patient(csv_line)
    raw_gender = csv_line[GENDER].strip
    gender = Gender.value_of(raw_gender)
    fio = csv_line[FIO]
    Patient.new(fio, gender)
  end

  def self.parse_diagnosis(csv_line)
    raw_diagnosis = csv_line[DIAGNOSIS_CODE].strip
    Diagnosis.value_of(raw_diagnosis)
  end

  def self.parse_period(csv_line)
    raw_period = csv_line[PERIOD].strip
    split_raw_period = raw_period.split(/\s+-\s+/)

    raise ArgumentError, PERIOD_NOT_VALID_FORMAT if split_raw_period.length != 2

    Period.new(
      Date.parse(split_raw_period[0]),
      Date.parse(split_raw_period[1])
    )
  end
end
