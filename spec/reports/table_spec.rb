require 'spec_helper'

describe 'table' do
  let(:structure) { table.structure }

  context 'when table does not have any structure' do
    subject(:table) do
      Class.new(Reports::Table)
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

  context 'when table has columns defined' do
    subject(:table) do
      Class.new(Reports::Table) do
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

    it 'does not define any rows' do
      expect(structure.rows).to be_empty
    end

    it 'does not define any cells' do
      expect(structure.cells).to be_empty
    end
  end

  context 'when table has rows defined' do
    subject(:table) do
      Class.new(Reports::Table) do
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

    it 'does not define any columns' do
      expect(structure.columns).to be_empty
    end

    it 'does not define any cells' do
      expect(structure.cells).to be_empty
    end
  end

  context 'when table has cells defined' do
    subject(:table) do
      Class.new(Reports::Table) do
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

    it 'does not define any columns' do
      expect(structure.columns).to be_empty
    end

    it 'does not define any rows' do
      expect(structure.rows).to be_empty
    end
  end
end
