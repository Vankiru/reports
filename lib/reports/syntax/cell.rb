# frozen_string_literal: true

module Reports
  module Syntax
    module Cell
      def cell(params, &block)
        column = Structure::Cell.new(params, block)

        structure.cells << column
      end
    end
  end
end
