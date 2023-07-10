module Reports
  module Syntax
    module Cell
      # Defines a cell
      #
      # @example one line
      #   cell :email
      #   cell :email, format: :string, reference: 'A1'
      #
      # @example with a block
      #   cell do |user|
      #     user.email
      #   end
      #
      #   cell format: :string do |user|
      #     user.email
      #   end
      #
      # @param [Symbol] name (nil) The name of a method that calculates the cell value
      # @param [Hash] options ({}) Additional parameters
      # @option options [Symbol] :format The name of a format
      # @option options [Symbol] :reference The cell address where the cell value will be put
      # @param [Proc] block A block that calculates the cell value
      #
      def cell(name = nil, options = {}, &block)
        options = name if name.is_a?(Hash)

        cell =
          Structure::Cell.new(
            format: options[:format],
            reference: options[:reference],
            data: block_given? ? block : name.to_sym.to_proc
          )

        structure.cells << cell
      end
    end
  end
end
