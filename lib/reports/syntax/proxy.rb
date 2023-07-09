module Reports
  module Syntax
    class Proxy
      def initialize(node)
        @node = node
      end

      class Formatter < Proxy
        include Syntax::Format
      end

      class Worksheet < Proxy
        include Syntax::Data
        include Syntax::Formatter

        include Syntax::Table
        include Syntax::Column
        include Syntax::Row
        include Syntax::Cell
      end

      class Table < Proxy
        include Syntax::Data
        include Syntax::Formatter

        include Syntax::Column
        include Syntax::Row
        include Syntax::Cell
      end
    end
  end
end
