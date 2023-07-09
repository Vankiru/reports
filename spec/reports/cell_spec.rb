require 'spec_helper'

describe 'cell' do
  let(:cell) { table.structure.cells.first }
  let(:user) { Struct.new(:email).new('john.doe@mail.com') }

  context 'when cell is defined with one line' do
    context 'and without params' do
      subject(:table) do
        Class.new(Reports::Table) do
          cell :email
        end
      end

      it 'sets cell reference to nil' do
        expect(cell.reference).to be_nil
      end

      it 'sets cell format to nil' do
        expect(cell.format).to be_nil
      end

      it 'sets cell data ' do
        expect(cell.data.call(user)).to eq('john.doe@mail.com')
      end
    end

    context 'and with params' do
      subject(:table) do
        Class.new(Reports::Table) do
          cell :email, reference: 'A1', format: :email
        end
      end

      it 'sets cell reference to nil' do
        expect(cell.reference).to eq('A1')
      end

      it 'sets cell format to nil' do
        expect(cell.format).to eq(:email)
      end

      it 'sets cell data ' do
        expect(cell.data.call(user)).to eq('john.doe@mail.com')
      end
    end
  end

  context 'when cell is defined with a block' do
    context 'and without params' do
      subject(:table) do
        Class.new(Reports::Table) do
          cell do |user|
            user.email
          end
        end
      end

      it 'sets cell reference to nil' do
        expect(cell.reference).to be_nil
      end

      it 'sets cell format to nil' do
        expect(cell.format).to be_nil
      end

      it 'sets cell data ' do
        expect(cell.data.call(user)).to eq('john.doe@mail.com')
      end
    end

    context 'and with params' do
      subject(:table) do
        Class.new(Reports::Table) do
          cell reference: 'A1', format: :email do |user|
            user.email
          end
        end
      end

      it 'sets cell reference to nil' do
        expect(cell.reference).to eq('A1')
      end

      it 'sets cell format to nil' do
        expect(cell.format).to eq(:email)
      end

      it 'sets cell data ' do
        expect(cell.data.call(user)).to eq('john.doe@mail.com')
      end
    end
  end
end
