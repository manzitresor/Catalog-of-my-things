require_relative '../app_helper'

RSpec.describe Genre do
  describe '#initialize' do
    it 'initializes a genre with a name' do
      genre = Genre.new('Action')
      expect(genre.name).to eq('Action')
    end
  end

  describe '#add_item' do
    it 'adds an item to the genre' do
      genre = Genre.new('Adventure')
      item = Item.new('Example Label')
      expect(item).to receive(:genre=).with(genre)
      genre.add_item(item)
      expect(genre.instance_variable_get(:@items)).to include(item)
    end

    it 'does not add invalid items to the genre' do
      genre = Genre.new('Horror')
      invalid_item = 'Not an Item object'
      expect { genre.add_item(invalid_item) }
        .to output("Invalid item. Please provide an instance of the Item class.\n").to_stdout
      expect(genre.instance_variable_get(:@items)).to be_empty
    end
  end
end
