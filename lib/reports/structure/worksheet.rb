# frozen_string_literal: true

module Reports
  class Structure
    class Worksheet < Node
      :data
      :formatter
      :childs
    end
  end
end
module Reports
  class Tree
    module Builder
      class Worksheet
        def initialize(parent)
          @parent = parent
        end

        def call(name, klass = nil, &block)
          @parent.add(
            build_node(name, klass, &block)
          )
        end

        private

        def build_node(name, klass, &block)
          node = node(name, klass) 

          if block_given?
            Dsl::Proxy::Worksheet.new(node).instance_eval(&block)
          end

          node
        end

        def node(name, klass)
          if klass
            klass.structure.root
          else
            Structure::Node.new
          end
        end
      end
    end
  end
end
