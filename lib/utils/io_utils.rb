# frozen_string_literal: true

# Module for work with input and output streams.
module IOUtils
  require 'csv'

  def self.read_csv(file_name, separator)
    CSV.parse(read_file(file_name), col_sep: separator)[1..-1]
  end

  def self.read_file(file_name)
    path = File.expand_path(format('../../data/%s', file_name), __dir__)
    File.read(path)
  end
end
