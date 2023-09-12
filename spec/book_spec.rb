require_relative '../app_helper'

describe Book do
  before :each do
    @book = Book.new('bad', 'manzi')
  end
  describe('Initialize parameters') do
    it 'throws an argumentError when given less than 2 arguments' do
      expect { Book.new 'Manzi' }.to raise_error(ArgumentError)
    end
  end
  describe '#can_be_archived?' do
    it 'when cover state is bad, it should return true' do
      result = @book.send(:can_be_archived?) # Call the private method using send
      expect(result).to be(true)
    end
  end
end
