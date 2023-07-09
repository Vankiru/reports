require 'spec_helper'

describe 'column' do
  let(:column) { table.structure.columns.first }
  let(:user) { Struct.new(:email).new('john.doe@mail.com') }

  context 'when column is defined with one line' do
    context 'and without params' do
      subject(:table) do
        Class.new(Reports::Table) do
          column :email
        end
      end

      it 'sets column header to nil' do
        expect(column.header).to be_nil
      end

      it 'sets column reference to nil' do
        expect(column.reference).to be_nil
      end

      it 'sets column format to nil' do
        expect(column.format).to be_nil
      end

      it 'sets column data ' do
        expect(column.data.call(user)).to eq('john.doe@mail.com')
      end
    end

    context 'and with params' do
      subject(:table) do
        Class.new(Reports::Table) do
          column :email, header: 'Email', reference: 'A1', format: :email
        end
      end

      it 'sets column header to nil' do
        expect(column.header).to eq('Email')
      end

      it 'sets column reference to nil' do
        expect(column.reference).to eq('A1')
      end

      it 'sets column format to nil' do
        expect(column.format).to eq(:email)
      end

      it 'sets column data ' do
        expect(column.data.call(user)).to eq('john.doe@mail.com')
      end
    end
  end

  context 'when column is defined with a block' do
    context 'and without params' do
      subject(:table) do
        Class.new(Reports::Table) do
          column 'Email' do |user|
            user.email
          end
        end
      end

      it 'sets column header to nil' do
        expect(column.header).to eq('Email')
      end

      it 'sets column reference to nil' do
        expect(column.reference).to be_nil
      end

      it 'sets column format to nil' do
        expect(column.format).to be_nil
      end

      it 'sets column data ' do
        expect(column.data.call(user)).to eq('john.doe@mail.com')
      end
    end

    context 'and with params' do
      subject(:table) do
        Class.new(Reports::Table) do
          column 'Email', reference: 'A1', format: :email do |user|
            user.email
          end
        end
      end

      it 'sets column header to nil' do
        expect(column.header).to eq('Email')
      end

      it 'sets column reference to nil' do
        expect(column.reference).to eq('A1')
      end

      it 'sets column format to nil' do
        expect(column.format).to eq(:email)
      end

      it 'sets column data ' do
        expect(column.data.call(user)).to eq('john.doe@mail.com')
      end
    end
  end
end
