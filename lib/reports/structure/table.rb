# frozen_string_literal: true

module Reports
  class Structure
    class Table < Node
      attribute :data
      attribute :formatter
      attribute :columns, type: Array
      attribute :rows, type: Array
      attribute :cells, type: Array
    end
  end
end
