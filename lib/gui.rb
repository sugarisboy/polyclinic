# frozen_string_literal: true

# Module for work with GUI
module Gui
  def self.print_welcome
    print '
Добро пожаловать в анализитор больничных листов.
Выберите необходимую услугу из следующего списка и
введите номер необходимой услуги:

  1. Случайный пациент
  2. Список врачей
  3. Количество пациентов
  4. Длительность больничного
  5. Максимальный и минимальный больничный
  6. Завершить работу

Воспользоваться услугой №:'
  end

  def self.listen_numeric_code_from(success_codes)
    answer = readline

    return if answer.nil?

    answer = answer.to_i

    if answer.zero?
      print 'Данная команда не распознана, повторите ввод:'
      listen_numeric_code_from(success_codes)
    end

    if success_codes.include? answer
      answer
    else
      printf('Команда №%d не найдена, повторите ввод:', answer)
      listen_numeric_code_from(success_codes)
    end
  end
end
