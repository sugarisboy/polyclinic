# frozen_string_literal: true

require_relative '../lib/gui'
require_relative '../lib/utils/io_utils'
require_relative '../lib/model/sick_list'
require_relative '../lib/command/command_holder'
require_relative '../lib/command/command_random_patient'
require_relative '../lib/model/period'
require 'time'
require_relative '../lib/model/gender'
require_relative '../lib/model/diagnosis'
require_relative '../lib/model/patient'

def load_data
  csv_data = IOUtils.read_csv('polyclinic_log.csv', ';')

  csv_data.map do |element|
    raw_period = element[3].strip.split(/\s+-\s+/)
    gender = Gender.value_of(element[2].strip)
    pacient = Patient.new(element[1], gender)
    period = Period.new(Time.parse(raw_period[0]), Time.parse(raw_period[1]))
    diagnosis = Diagnosis.value_of(element[4])
    SickList.new(element[0], pacient, period, diagnosis, element[5])
  end
end

def init_command_holder
  command_holder = CommandHolder.new
  command_holder.add_command CommandRandomPatient.instance
  command_holder
end

def main
  data = load_data
  command_holder = init_command_holder
  success_codes = command_holder.numeric_codes

  loop do
    Gui.print_welcome
    listened_numeric_code = Gui.listen_numeric_code_from success_codes
    command = command_holder.find_by_numeric_code listened_numeric_code
    command.execute data
  end
end

main if __FILE__ == $PROGRAM_NAME
