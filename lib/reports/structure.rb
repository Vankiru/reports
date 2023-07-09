# frozen_string_literal: true

module Reports
  class Structure
    attr_reader :root

    def initialize
      @root = Report.new
    end

    def traverse(&block)
      @root.traverse(&block)
    end
  end
end
