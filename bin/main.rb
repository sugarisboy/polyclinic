# frozen_string_literal: true

require_relative '../lib/analyzer'

def main
  Analyzer.instance.init
end

main if __FILE__ == $PROGRAM_NAME
