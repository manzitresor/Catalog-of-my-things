require_relative '../app_helper'
require 'date'

describe Item do
  let(:today) { Date.today }
  let(:ten_years_ago) { Date.new(today.year - 10, today.month, today.day) }
  let(:item) { Item.new(today, source: 'Sample Source', archived: false) }

  context 'when creating a new item' do
    it 'has default values for genre, author, and label' do
      expect(item.genre).to be_nil
      expect(item.author).to be_nil
      expect(item.label).to be_nil
    end

    it 'has the provided source' do
      expect(item.source).to eq('Sample Source')
    end

    it 'has the provided publish date' do
      expect(item.publish_date).to eq(today)
    end

    it 'is not archived by default' do
      expect(item.instance_variable_get(:@archived)).to be(false)
    end

    it 'assigns a random id between 1 and 1000' do
      expect(item.instance_variable_get(:@id)).to be_between(1, 1000).inclusive
    end
  end

  context 'when moving an item to the archive' do
    it 'archives the item if it can be archived' do
      item.instance_variable_set(:@publish_date, ten_years_ago + 1)
      item.move_to_archive
      expect(item.instance_variable_get(:@archived)).to be(true)
    end

    it 'does not archive the item if it cannot be archived' do
      item.instance_variable_set(:@publish_date, ten_years_ago - 1)
      item.move_to_archive
      expect(item.instance_variable_get(:@archived)).to be(false)
    end
  end
end
