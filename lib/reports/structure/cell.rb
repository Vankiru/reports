# frozen_string_literal: true

module Reports
  class Structure
    class Cell < Node
      attribute :header
      attribute :reference
      attribute :format
      attribute :data
    end
  end
end
