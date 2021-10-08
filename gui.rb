module Gui

  def Gui.print_welcome
    print "
Добро пожаловать в анализитор больничных листов.
Выберите необходимую услугу из следующего списка и
введите номер необходимой услуги:

  1. Случайный пациент
  2. Список врачей
  3. Количество пациентов
  4. Длительность больничного
  5. Максимальный и минимальный больничный
  6. Завершить работу

Воспользоваться услугой №:"
  end

  def Gui.listen_numeric_code_from(success_codes)
    answer = readline

    if answer == nil
      return
    end

    answer = answer.to_i

    if answer == 0
      print "Данная команда не распознана, повторите ввод:"
      listen_numeric_code_from(success_codes)
    end

    unless success_codes.include? answer
      printf "Команда №%d не найдена, повторите ввод:" % answer
      listen_numeric_code_from(success_codes)
    else
      answer
    end
  end

end
