class Genre
    attr_accessor :name
  
    def initialize(name)
      @name = name
      @id = Random.rand(1..1000)
      @items = []
    end
end
  