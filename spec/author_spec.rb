require_relative '../app_helper'

describe Label do
  before :each do
    @author = Author.new('Timmoty', 'Grims')
    @item = Item.new('20-3-2023')
  end
  describe 'Initialize parameters' do
    it 'throws an argumentError when given less than 2 arguments' do
      expect { Author.new 'react' }.to raise_error(ArgumentError)
    end
  end
  describe '#add_item' do
    it 'should have empty array' do
      expect(@author.items).to be_empty
    end

    it 'add item in items array' do
      @author.add_item(@item)
      expect(@author.items).to include(@item)
    end
    it 'Does not add item twice' do
      @author.add_item(@item)
      @author.add_item(@item)
      expect(@author.items.count(@item)).to eq(1)
    end
  end
end
