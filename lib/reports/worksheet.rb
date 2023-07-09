module Reports
  class Worksheet
    extend Syntax::Data
    extend Syntax::Formatter
    extend Syntax::Table
    extend Syntax::Column
    extend Syntax::Row
    extend Syntax::Cell

    class << self
      def structure
        @structure ||= Structure::Worksheet.new
      end
    end
  end
end
