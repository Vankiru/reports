module Reports
  class Structure
    class Table < Structure
      attribute :data
      attribute :formatter
      attribute :columns, type: Array
      attribute :rows, type: Array
      attribute :cells, type: Array
    end
  end
end
