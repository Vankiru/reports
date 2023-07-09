# frozen_string_literal: true

module Reports
  class Structure
    class Node
      class << self
        def attribute(name, type: nil)
          attributes[name] = type

          attr_reader name
        end

        def attributes
          @attributes ||= {}
        end
      end

      def initialize(**attributes)
        self.class.attributes.each do |name, type|
          value =
            if attributes.has_key?(name)
              attributes[name]
            else
              type ? type.new : nil
            end

          instance_variable_set("@#{name}", value)
        end
      end

      # def traverse(&block)
      # yield self if block_given?

      # @chidlren.each do |child|
      # child.traverse(&block)
      # end
      # end

      # def leaf?
      # @children.empty?
      # end

      # def internal?
      # !leaf?
      # end
    end
  end
end
