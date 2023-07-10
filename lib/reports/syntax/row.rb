module Reports
  module Syntax
    module Row
      # Defines a row
      #
      # @example one line
      #   row :email
      #   row :email, header: 'Email, format: :string
      #   row :email, reference: :A
      #
      # @example with a block
      #   row 'Email' do |user|
      #     user.email
      #   end
      #
      #   row 'Email', format: :string do |user|
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
      def row(name, options = {}, &block)
        row =
          Structure::Row.new(
            header: block_given? ? name : options[:header],
            reference: options[:reference],
            format: options[:format],
            data: block_given? ? block : name.to_sym.to_proc
          )

        structure.rows << row
      end
    end
  end
end
