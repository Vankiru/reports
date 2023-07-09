# frozen_string_literal: true

module Reports
  module Syntax
    module Formatter
      # @example with a class
      #   formatter UserFormatter
      #
      #   class UserFormatter < Reports::Formatter
      #     format :date do
      #       # defines the format
      #     end
      #   end
      #
      # @example with a block
      #   formatter
      #     format :date do
      #       # defines the format
      #     end
      #   end
      #
      # @param [Symbol] name
      # @param [Proc] block
      def formatter(klass, &block)
        if block_given?
          klass = Class.new(Reports::Formatter)
          klass.instance_eval(&block)
        end

        structure.formatter = klass.structure
      end
    end
  end
end
