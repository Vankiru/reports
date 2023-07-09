# frozen_string_literal: true

module Reports
  module Syntax
    module Worksheet
      # @example with a class
      #   worksheet 'Users', UserWorksheet
      #
      #   class UserTable < Reports::Worksheet
      #     column :name
      #     column :email
      #     column :phone
      #   end
      #
      # @example with a block
      #   worksheet 'Users' do
      #     column :name
      #     column :email
      #     column :phone
      #   end
      #
      # @example worksheet can define tables, data and formatters that will specific for this worksheet
      #   worksheet 'Users' do
      #     data UserData
      #     formatter UserFormatter
      #
      #     table do
      #       column :name
      #       column :email
      #       column :phone
      #     end
      #
      #     table do
      #       column :login
      #       column :last_login_at
      #     end
      #   end
      #
      # @param [Class] klass
      # @param [Proc] block
      def worksheet(_name = nil, klass = nil, &block)
        if block_given?
          klass = Class.new(Reports::Worksheet)
          klass.instance_eval(&block)
        end

        structure.worksheets << klass.structure
      end
    end
  end
end
