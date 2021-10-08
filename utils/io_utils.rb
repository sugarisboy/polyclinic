
module IOUtils
  require 'csv'

  def IOUtils.read_csv(file_name, separator)
    CSV.parse(read_file(file_name), col_sep: separator)[1..-1]
  end

  def IOUtils.read_file(file_name)
    path = File.expand_path('../resources/' + file_name, __dir__)
    text = File.read(path)
  end

end