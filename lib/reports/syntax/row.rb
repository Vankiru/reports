# frozen_string_literal: true

module Reports
  module Syntax
    module Row
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
      # @param [Symbol, String] name
      # @param [Hash] params
      # @option params [Symbol] :header
      # @option params [Symbol] :format
      # @option params [Symbol] :reference
      # @param [Proc] block
      def row(name, params, &block)
        row = 
          Structure::Row.new(
            header: block_given? ? name : params[:header],
            reference: params[:reference],
            format: params[:format],
            data: block_given? ? block : name.to_proc
          )

        structure.rows << rows
      end
    end
  end
end
