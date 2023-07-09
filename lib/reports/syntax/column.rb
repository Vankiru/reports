# frozen_string_literal: true

module Reports
  module Syntax
    module Column
      # @example one line
      #   column :email
      #   column :email, header: 'Email, format: :string
      #   column :email, reference: :A
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
      # @param [Symbol, String] name
      # @param [Hash] params
      # @option params [Symbol] :header
      # @option params [Symbol] :format
      # @option params [Symbol] :reference
      # @param [Proc] block
      def column(name, params, &block)
        column = 
          Structure::Column.new(
            header: block_given? ? name : params[:header],
            reference: params[:reference],
            format: params[:format],
            data: block_given? ? block : name.to_proc
          )

        structure.columns << column
      end
    end
  end
end
