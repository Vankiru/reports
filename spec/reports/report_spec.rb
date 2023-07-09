require 'spec_helper'

describe Reports::Report do
  let(:structure) { report.structure }

  context 'when report does not have any structure' do
    subject(:report) do
      Class.new(Reports::Report)
    end

    it 'does not define any worksheets' do
      expect(structure.worksheets).to be_empty
    end

    it 'does not define any tables' do
      expect(structure.tables).to be_empty
    end

    it 'does not define any columns' do
      expect(structure.columns).to be_empty
    end

    it 'does not define any rows' do
      expect(structure.rows).to be_empty
    end

    it 'does not define any cells' do
      expect(structure.cells).to be_empty
    end
  end

  context 'when report has worksheets defined' do
    subject(:report) do
      Class.new(Reports::Report) do
        worksheet do
          column :name
        end

        worksheet do
          column :email
          column :phone
        end
      end
    end

    it 'defines each worksheet' do
      expect(structure.worksheets).to match_array([
        be_kind_of(Reports::Structure::Worksheet),
        be_kind_of(Reports::Structure::Worksheet)
      ])
    end

    it 'does not define any columns' do
      expect(structure.columns).to be_empty
    end

    it 'does not define any rows' do
      expect(structure.rows).to be_empty
    end

    it 'does not define any cells' do
      expect(structure.cells).to be_empty
    end
  end

  context 'when report has tables defined' do
    subject(:report) do
      Class.new(Reports::Report) do
        table do
          column :name
        end

        table do
          column :email
          column :phone
        end
      end
    end

    it 'defines each tables' do
      expect(structure.tables).to match_array([
        be_kind_of(Reports::Structure::Table),
        be_kind_of(Reports::Structure::Table)
      ])
    end

    it 'does not define any worksheets' do
      expect(structure.worksheets).to be_empty
    end

    it 'does not define any columns' do
      expect(structure.columns).to be_empty
    end

    it 'does not define any rows' do
      expect(structure.rows).to be_empty
    end

    it 'does not define any cells' do
      expect(structure.cells).to be_empty
    end
  end

  context 'when report has columns defined' do
    subject(:report) do
      Class.new(Reports::Report) do
        column :name
        column :email
        column :phone
      end
    end

    it 'defines each column' do
      expect(structure.columns).to match_array([
        be_kind_of(Reports::Structure::Column),
        be_kind_of(Reports::Structure::Column),
        be_kind_of(Reports::Structure::Column)
      ])
    end

    it 'does not define any worksheets' do
      expect(structure.worksheets).to be_empty
    end

    it 'does not define tables' do
      expect(structure.tables).to be_empty
    end

    it 'does not define any rows' do
      expect(structure.rows).to be_empty
    end

    it 'does not define any cells' do
      expect(structure.cells).to be_empty
    end
  end

  context 'when report has rows defined' do
    subject(:report) do
      Class.new(Reports::Report) do
        row :name
        row :email
        row :phone
      end
    end

    it 'defines each row' do
      expect(structure.rows).to match_array([
        be_kind_of(Reports::Structure::Row),
        be_kind_of(Reports::Structure::Row),
        be_kind_of(Reports::Structure::Row)
      ])
    end

    it 'does not define any worksheets' do
      expect(structure.worksheets).to be_empty
    end

    it 'does not define tables' do
      expect(structure.tables).to be_empty
    end

    it 'does not define any columns' do
      expect(structure.columns).to be_empty
    end

    it 'does not define any cells' do
      expect(structure.cells).to be_empty
    end
  end

  context 'when report has cells defined' do
    subject(:report) do
      Class.new(Reports::Report) do
        cell :name
        cell :email
        cell :phone
      end
    end

    it 'defines each cell' do
      expect(structure.cells).to match_array([
        be_kind_of(Reports::Structure::Cell),
        be_kind_of(Reports::Structure::Cell),
        be_kind_of(Reports::Structure::Cell)
      ])
    end

    it 'does not define any worksheets' do
      expect(structure.worksheets).to be_empty
    end

    it 'does not define tables' do
      expect(structure.tables).to be_empty
    end

    it 'does not define any columns' do
      expect(structure.columns).to be_empty
    end

    it 'does not define any rows' do
      expect(structure.rows).to be_empty
    end
  end
end
