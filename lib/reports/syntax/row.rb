# frozen_string_literal: true

module Reports
  module Syntax
    module Row
      def row(params, &block)
        column = Structure::Row.new(params, block)

        structure.rows << column
      end
    end
  end
end
