# frozen_string_literal: true

module Reports
  module Syntax
    module Column
      def column(params, &block)
        column = Structure::Column.new(params, block)

        structure.columns.add(column)
      end
    end
  end
end
