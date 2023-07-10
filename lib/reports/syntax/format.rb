module Reports
  module Syntax
    module Format
      # Defines an individual format
      #
      # @example
      #   format :string do |value|
      #     value.to_s
      #   end
      #
      # @param [Symbol] name Format name
      # @param [Proc] block Block that defines the format
      def format(name, &block)
        structure.formats[name] = Structure::Format.new(name: name, block: block)
      end
    end
  end
end
