module Reports
  module Syntax
    module Column
      # Defines a column
      #
      # @example one line
      #   column :email
      #   column :email, header: 'Email, format: :string
      #   column :email, reference: 'A'
      #
      # @example with a block
      #   column 'Email' do |user|
      #     user.email
      #   end
      #
      #   column 'Email', format: :string do |user|
      #     user.email
      #   end
      #
      # @param [Symbol, String] name The name of a method that calculates the column value (for one line)
      #   or the header name (for block)
      # @param [Hash] options ({})
      # @option options [Symbol] :header The header name
      # @option options [Symbol] :format The name of a format
      # @option options [Symbol] :reference The cell address where the cell value will be put
      # @param [Proc] block A block that calculates the column value
      #
      def column(name, options = {}, &block)
        column =
          Structure::Column.new(
            header: block_given? ? name : options[:header],
            reference: options[:reference],
            format: options[:format],
            data: block_given? ? block : name.to_sym.to_proc
          )

        structure.columns << column
      end
    end
  end
end
