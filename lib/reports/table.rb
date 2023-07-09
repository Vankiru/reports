# frozen_string_literal: true

module Reports
  class Table
    extend Syntax::Data
    extend Syntax::Formatter
    extend Syntax::Column
    extend Syntax::Row
    extend Syntax::Cell

    class << self
      def structure
        @structure ||= Structure::Table.new
      end
    end
  end
end
