# frozen_string_literal: true

module Reports
  module Syntax
    module Format
      def format(params, &block)
        format = Structure::Format.new(params, block)

        structure.formats.add(format)
      end
    end
  end
end
