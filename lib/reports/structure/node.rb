# frozen_string_literal: true

module Reports
  class Structure
    class Node
      class << self
        def attribute(name, type: nil)
          attributes << name
          variable = "@#{variable}"

          define_method name do
            if defined?(variable)
              instance_variable_get(variable) 
            else
              instance_variable_set(variable, type ? type.new : nil)
            end
          end
        end

        def attributes
          @attributes ||= []
        end
      end

      def initialize(**attributes)
        self.class.attributes.each do |name|
          instance_variable_set("@#{name}", attributes[name])
        end
      end

      #def traverse(&block)
        #yield self if block_given?

        #@chidlren.each do |child|
          #child.traverse(&block)
        #end
      #end

      #def leaf?
        #@children.empty?
      #end

      #def internal?
        #!leaf?
      #end
    end
  end
end
