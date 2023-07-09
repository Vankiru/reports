require 'spec_helper'

describe 'formatter' do
  let(:structure) { formatter.structure }

  context 'when formatter does not have any structure' do
    subject(:formatter) do
      Class.new(Reports::Formatter)
    end

    it 'does not define formats' do
      expect(structure.formats).to be_empty
    end
  end

  context 'when formatter has a structure defined' do
    subject(:formatter) do
      Class.new(Reports::Formatter) do
        format :string do |value|
          value.to_s
        end

        format :integer do |value|
          value.to_i
        end
      end
    end

    it 'defines each format' do
      expect(structure.formats).to include(
        string: be_kind_of(Reports::Structure::Format),
        integer: be_kind_of(Reports::Structure::Format)
      )
    end
  end
end
