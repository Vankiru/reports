# frozen_string_literal: true

module Reports
  class Report
    extend Syntax::Data
    extend Syntax::Formatter

    extend Syntax::Worksheet
    extend Syntax::Table
    extend Syntax::Column
    extend Syntax::Row
    extend Syntax::Cell

    def initialize(data)
      @data = data
    end

    def render(options)
    end
  end
end
