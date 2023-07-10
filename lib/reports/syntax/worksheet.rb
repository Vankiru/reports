module Reports
  module Syntax
    module Worksheet
      # Defines a worksheet
      #
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
      # @example worksheet can define tables, data and formatters that 
      #   will be specific for this worksheet
      #
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
      # @param [Class] name The worksheet name
      # @param [Class] klass (nil) The name of a class that defines the worksheet
      # @param [Proc] block Block that defines the worksheet
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
