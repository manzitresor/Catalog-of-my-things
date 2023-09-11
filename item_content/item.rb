class Item
    attr_accessor :genre, :author, :source, :label, :publish_date,

    def initialize(id,genre,author,source,label,publish_date,archived)
      @id = id,
      @genre = genre,
      @author = author,
      @source = source,
      @label = label,
      @publish_date = publish_date,
      @archived = archived
    end

    private
    def can_be_archived?
        @publish_date > 10 ? true : false
    end

    public
    def move_to_archive
        if self.can_be_archived? == true
            @archived = true
        end
    end
    
    
end
