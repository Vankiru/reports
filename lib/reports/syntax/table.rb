module Reports
  module Syntax
    module Table
      # Defines a table
      #
      # @example with a class
      #   table UserTable
      #
      #   class UserTable < Reports::Table
      #     column :name
      #     column :email
      #     column :phone
      #   end
      #
      # @example with a block
      #   table do
      #     column :name
      #     column :email
      #     column :phone
      #   end
      #
      # @example table can define data and formatters that 
      #   will specific for this table
      #
      #   table do
      #     data UserData
      #     formatter UserFormatter
      #
      #     column :name
      #     column :email
      #     column :phone
      #   end
      #
      # @param [Class] klass (nil) The name of a class that defines the table
      # @param [Proc] block Block that defines the table
      def table(klass = nil, &block)
        if block_given?
          klass = Class.new(Reports::Table)
          klass.instance_eval(&block)
        end

        structure.tables << klass.structure
      end
    end
  end
end
