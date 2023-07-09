# frozen_string_literal: true

module Reports
  module Syntax
    module Data
      class << self
        def data(*params, &block)
          Handlers::Data.new(self).(params, &block)
        end
      end
    end

    module Formatter
      class << self
        def formatter(*params, &block)
          Handlers::Formatter.new(self).(params, &block)
        end
      end
    end

    module Format
      class << self
        def format(*params, &block)
          Handlers::Format.new(self).(params, &block)
        end
      end
    end

    module Worksheet
      class << self
        def worksheet(*params, &block)
          Handlers::Formatter.new(self).(params, &block)
        end
      end
    end

    module Table
      class << self
        def table(*params, &block)
          Handlers::Table.new(self).(params, &block)
        end
      end
    end

    module Column
      class << self
        def column(*params, &block)
          Handlers::Column.new(self).(params, &block)
        end
      end
    end

    module Row
      class << self
        def row(*params, &block)
          Handlers::Row.new(self).(params, &block)
        end
      end
    end

    module Cell
      class << self
        def cell(*params, &block)
          Handlers::Cell.new(self).(params, &block)
        end
      end
    end
  end
end
