module Reports
  class Structure
    class << self
      def attribute(name, type: nil)
        attributes[name] = type

        attr_accessor name
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

        send("#{name}=", value)
      end
    end
  end
end

require 'reports/structure/cell'
require 'reports/structure/column'
require 'reports/structure/data'
require 'reports/structure/format'
require 'reports/structure/formatter'
require 'reports/structure/report'
require 'reports/structure/row'
require 'reports/structure/table'
require 'reports/structure/worksheet'
