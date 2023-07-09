# frozen_string_literal: true

module Reports
  class Tree
    class Node
      def initialize(type:, params:)
        @type = type
        @params = params
        @children = []
      end

      def leaf?
        @children.empty?
      end

      def internal?
        !leaf?
      end

      def add(node)
        @children << node
      end

      def traverse(&block)
        yield self if block_given?

        @chidlren.each do |child|
          child.traverse(&block)
        end
      end
    end
  end
end
