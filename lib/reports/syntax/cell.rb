# frozen_string_literal: true

module Reports
  module Syntax
    module Cell
      # @example one line
      #   cell :email
      #   cell :email, format: :string
      #   cell :email, reference: 'A1'
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
      # @param [Symbol] name
      # @param [Hash] params
      # @option params [Symbol] :format
      # @option params [Symbol] :reference
      # @param [Proc] block
      def cell(name, params, &block)
        cell = 
          Structure::Cell.new(
            format: params[:format],
            reference: params[:reference],
            data: name ? name.to_proc : block
          )

        structure.cells << cell
      end
    end
  end
end
