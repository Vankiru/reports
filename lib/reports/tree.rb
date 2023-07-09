# frozen_string_literal: true

module Reports
  class Tree
    attr_reader :root

    def traverse(&block)
      @root.traverse(&block)
    end
  end
end
