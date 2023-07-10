module Reports
  class Report
    extend Syntax::Data
    extend Syntax::Formatter
    extend Syntax::Worksheet
    extend Syntax::Table
    extend Syntax::Column
    extend Syntax::Row
    extend Syntax::Cell

    class << self
      def structure
        @structure ||= Structure::Report.new
      end
    end

    def initialize(data)
      @data = data
    end

    def render(options); end
  end
end
