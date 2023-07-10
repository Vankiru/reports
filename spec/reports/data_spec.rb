require 'spec_helper'

class UserData
  def call
    [1, 2, 3]
  end
end

describe 'data' do
  context 'when data is defined with a class' do
    subject(:data) do
      Class.new(Reports::Table) do
        data UserData
      end
    end

    let(:structure) { data.structure }
    let(:data_proc) { structure.data.data.call }

    it 'sets data to a class instance' do
      expect(data_proc).to eq([1, 2, 3])
    end
  end

  context 'when data is defined with a block' do
    subject(:data) do
      Class.new(Reports::Table) do
        data do
          [1, 2, 3]
        end
      end
    end

    let(:structure) { data.structure }
    let(:data_proc) { structure.data.data.call }

    it 'sets data to block' do
      expect(data_proc).to eq([1, 2, 3])
    end
  end

  context 'when data is defined with a class and a block' do
    subject(:data) do
      Class.new(Reports::Table) do
        data UserData do
          [4, 5, 6]
        end
      end
    end

    let(:structure) { data.structure }
    let(:data_proc) { structure.data.data.call }

    it 'sets data to block' do
      expect(data_proc).to eq([4, 5, 6])
    end
  end
end
