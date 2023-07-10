module Reports
  module Syntax
    module Data
      # Defines data for a report
      #
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
      # @param [Class] klass (nil) The name of a class that defines report data
      # @param [Proc] block A block that defines report data
      def data(klass = nil, &block)
        data = block_given? ? block : klass&.new

        structure.data = Structure::Data.new(data: data)
      end
    end
  end
end
