require 'spec_helper'

describe 'worksheet' do
  let(:structure) { worksheet.structure }

  context 'when worksheet does not have any structure' do
    subject(:worksheet) do
      Class.new(Reports::Worksheet)
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

  context 'when worksheet has tables defined' do
    subject(:worksheet) do
      Class.new(Reports::Worksheet) do
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

  context 'when worksheet has columns defined' do
    subject(:worksheet) do
      Class.new(Reports::Worksheet) do
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

    it 'does not define any tables' do
      expect(structure.tables).to be_empty
    end

    it 'does not define any rows' do
      expect(structure.rows).to be_empty
    end

    it 'does not define any cells' do
      expect(structure.cells).to be_empty
    end
  end

  context 'when worksheet has rows defined' do
    subject(:worksheet) do
      Class.new(Reports::Worksheet) do
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

    it 'does not define any tables' do
      expect(structure.tables).to be_empty
    end

    it 'does not define any columns' do
      expect(structure.columns).to be_empty
    end

    it 'does not define any cells' do
      expect(structure.cells).to be_empty
    end
  end

  context 'when worksheet has cells defined' do
    subject(:worksheet) do
      Class.new(Reports::Worksheet) do
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

    it 'does not define any tables' do
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
