module Reports
  class Structure
    class Report < Structure
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
