# frozen_string_literal: true

module Reports
  module Syntax
    module Worksheet
      def worksheet(klass, &block)
        if block_given?
          klass = Class.new(Reports::Worksheet)
          klass.instance_eval(&block)
        end

        structure.worksheets.add(klass.structure)
      end
    end
  end
end
