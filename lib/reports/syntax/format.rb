# frozen_string_literal: true

module Reports
  module Syntax
    module Format
      # @example
      #   format :date do
      #     # defines the format
      #   end
      #
      # @param [Symbol] name
      # @param [Proc] block
      def format(name, &block)
        structure.formats[name] = Structure::Format.new(name: name, block: block)
      end
    end
  end
end
