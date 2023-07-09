# frozen_string_literal: true

module Reports
  module Syntax
    def data(klass, &block)
      Builders::Data.new(node).build(klass, &block)
    end

    # formatter do
    #   format :name do
    #   end
    # end
    def formatter(klass, &block)
      Builders::Formatter.new(node).build(klass, &block)
    end
    
    def worksheet(name, params, &block)
      Builders::Worksheet.new(node).build(name, params, &block)
    end

    def table
      Builders::Table.new(node).build(name, params, &block)
    end

    def column
      Builders::Column.new(node).build(name, params, &block)
    end

    def row
      Builders::Row.new(node).build(name, params, &block)
    end

    def cell
      Builders::Cell.new(node).build(name, params, &block)
    end
  end
end
