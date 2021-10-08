require_relative 'gui'
require_relative 'utils/io_utils'
require_relative 'model/sick_list'
require_relative 'command/command_holder'
require_relative 'command/command_random_patient'
require_relative 'model/period'
require 'time'
require_relative 'model/gender'
require_relative 'model/diagnosis'

def load_data
  csv_data = IOUtils.read_csv('polyclinic_log.csv', ';')

  csv_data.map do |element|
    rawPeriod = element[3].strip.split(/\s+-\s+/)
    gender = Gender.value_of(element[2].strip)
    period = Period.new(Time.parse(rawPeriod[0]), Time.parse(rawPeriod[1]))
    diagnosis = Diagnosis.value_of(element[4])
    SickList.new(element[0], element[1], gender, period, diagnosis, element[5])
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
