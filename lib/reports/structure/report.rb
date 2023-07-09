# frozen_string_literal: true

module Reports
  class Structure
    class Report < Node
      attribute :data
      attribute :formatter
      attribute :worksheets, type: Array
      attribute :tables, type: Array
      attribute :columns, type: Array
      attribute :rows, type: Array
      attribute :cells, type: Array
    end
  end
end
