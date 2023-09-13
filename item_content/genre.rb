class Genre
  attr_accessor :name

  def initialize(name)
    @name = name
    @id = Random.rand(1..1000)
    @items = []
  end

  def add_item(item)
    if item.is_a?(Item)
      @items << item
      item.genre = self
    else
      puts 'Invalid item. Please provide an instance of the Item class.'
    end
  end
end
