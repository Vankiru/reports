require 'spec_helper'

describe 'row' do
  let(:row) { table.structure.rows.first }
  let(:user) { Struct.new(:email).new('john.doe@mail.com') }

  context 'when row is defined with one line' do
    context 'and without params' do
      subject(:table) do
        Class.new(Reports::Table) do
          row :email
        end
      end

      it 'sets row header to nil' do
        expect(row.header).to be_nil
      end

      it 'sets row reference to nil' do
        expect(row.reference).to be_nil
      end

      it 'sets row format to nil' do
        expect(row.format).to be_nil
      end

      it 'sets row data ' do
        expect(row.data.call(user)).to eq('john.doe@mail.com')
      end
    end

    context 'and with params' do
      subject(:table) do
        Class.new(Reports::Table) do
          row :email, header: 'Email', reference: 'A1', format: :email
        end
      end

      it 'sets row header to nil' do
        expect(row.header).to eq('Email')
      end

      it 'sets row reference to nil' do
        expect(row.reference).to eq('A1')
      end

      it 'sets row format to nil' do
        expect(row.format).to eq(:email)
      end

      it 'sets row data ' do
        expect(row.data.call(user)).to eq('john.doe@mail.com')
      end
    end

    context 'and name is a string' do
      subject(:table) do
        Class.new(Reports::Table) do
          row 'email'
        end
      end

      it 'sets row data to name.to_proc' do
        expect(row.data.call(user)).to eq('john.doe@mail.com')
      end
    end
  end

  context 'when row is defined with a block' do
    context 'and without params' do
      subject(:table) do
        Class.new(Reports::Table) do
          row 'Email' do |user|
            user.email
          end
        end
      end

      it 'sets row header to nil' do
        expect(row.header).to eq('Email')
      end

      it 'sets row reference to nil' do
        expect(row.reference).to be_nil
      end

      it 'sets row format to nil' do
        expect(row.format).to be_nil
      end

      it 'sets row data ' do
        expect(row.data.call(user)).to eq('john.doe@mail.com')
      end
    end

    context 'and with params' do
      subject(:table) do
        Class.new(Reports::Table) do
          row 'Email', reference: 'A1', format: :email do |user|
            user.email
          end
        end
      end

      it 'sets row header to nil' do
        expect(row.header).to eq('Email')
      end

      it 'sets row reference to nil' do
        expect(row.reference).to eq('A1')
      end

      it 'sets row format to nil' do
        expect(row.format).to eq(:email)
      end

      it 'sets row data ' do
        expect(row.data.call(user)).to eq('john.doe@mail.com')
      end
    end
  end
end
