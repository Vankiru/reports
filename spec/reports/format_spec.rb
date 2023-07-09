require 'spec_helper'

describe 'format' do
  subject(:formatter) do
    Class.new(Reports::Formatter) do
      format :string do |value|
        value.to_s
      end
    end
  end

  let(:structure) { formatter.structure }
  let(:format) { structure.formats[:string] }

  it 'sets format name' do
    expect(format.name).to eq(:string)
  end

  it 'sets format block' do
    expect(format.block.call(1)).to eq('1')
  end
end
