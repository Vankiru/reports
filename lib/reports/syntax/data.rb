# frozen_string_literal: true

module Reports
  module Syntax
    module Data
      def build(klass, &block)
        structure.data = Structure::Data.new(klass, block)
      end
    end
  end
end
