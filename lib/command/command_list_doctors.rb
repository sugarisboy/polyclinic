# frozen_string_literal: true

require 'singleton'
require_relative '../command/Command'

# Command list doctors view
class CommandListDoctors < Command
  include Singleton

  def initialize
    super
    @numeric_code = 2
    @name = 'Список врачей'
  end

  def execute(data)
    doctors = data.map(&:doctor)
    unique_doctors = doctors.uniq
    sorted_doctors = unique_doctors.sort
    sorted_doctors.each_with_index do |doctor, i|
      printf(
        "%<index>4.d. %<doctor>s\n",
        {
          index: i + 1,
          doctor: doctor
        }
      )
    end
  end
end
