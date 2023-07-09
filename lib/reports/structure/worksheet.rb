# frozen_string_literal: true

module Reports
  class Structure
    class Worksheet < Node
      attribute :data
      attribute :formatter
      attribute :tables, type: Array
      attribute :columns, type: Array
      attribute :rows, type: Array
      attribute :cells, type: Array
    end
  end
end
