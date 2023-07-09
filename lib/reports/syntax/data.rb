# frozen_string_literal: true

module Reports
  module Syntax
    module Data
      # @example with a class
      #   data UserData
      #
      #   class UserData
      #     def call(params)
      #       User.where(params)
      #     end
      #   end
      #
      # @example with a block
      #   data do |params|
      #     User.where(params)
      #   end
      #
      # @param [Class] klass
      # @param [Proc] block
      def data(klass, &block)
        structure.data = Structure::Data.new(data: klass ? klass.new : block)
      end
    end
  end
end
