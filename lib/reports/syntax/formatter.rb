module Reports
  module Syntax
    module Formatter
      # Defines a set of formats
      #
      # @example with a class
      #   formatter UserFormatter
      #
      #   class UserFormatter < Reports::Formatter
      #     format :string do |value|
      #       value.to_s
      #     end
      #   end
      #
      # @example with a block
      #   formatter
      #     format :string do |value|
      #       value.to_s
      #     end
      #   end
      #
      # @param [Class] klass (nil) The name of a class that defines formats
      # @param [Proc] block A block that defines formats
      def formatter(klass = nil, &block)
        if block_given?
          klass = Class.new(Reports::Formatter)
          klass.instance_eval(&block)
        end

        structure.formatter = klass.structure
      end
    end
  end
end
