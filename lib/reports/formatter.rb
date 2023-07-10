module Reports
  class Formatter
    extend Syntax::Format

    class << self
      def structure
        @structure ||= Structure::Formatter.new
      end
    end
  end
end
