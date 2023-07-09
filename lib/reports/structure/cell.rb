# frozen_string_literal: true

module Reports
  class Structure
    class Cell < Node
      attribute :reference
      attribute :format
      attribute :data
    end
  end
end
