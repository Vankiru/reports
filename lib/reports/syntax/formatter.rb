# frozen_string_literal: true

module Reports
  module Syntax
    module Formatter
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
