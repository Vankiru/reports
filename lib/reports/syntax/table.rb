# frozen_string_literal: true

module Reports
  module Syntax
    module Table
      def table(klass, &block)
        if block_given?
          klass = Class.new(Reports::Table)
          klass.instance_eval(&block)
        end

        structure.tables.add(klass.structure)
      end
    end
  end
end
