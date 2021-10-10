# frozen_string_literal: true

require 'csv'

# Module for work with input and output streams.
module IOUtils
  DATA_DIR = '../../data'

  def self.read_csv(file_name, sep)
    text = read_file(file_name)
    CSV.parse(text, col_sep: sep, headers: true)
  end

  def self.read_file(file_name)
    local_path = format(
      '%<data_dir>s/%<file_name>s',
      { data_dir: DATA_DIR, file_name: file_name }
    )
    path = File.expand_path(local_path, __dir__)
    File.read(path)
  end

  def self.colored(str)
    format("\e[35m%s\e[0m", str)
  end
end
