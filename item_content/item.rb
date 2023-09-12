require 'date'
class Item
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(genre, author, source, label)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = Date.today
    @archived = true
  end

  private

  def can_be_archived?
    @publish_date > 10
  end

  public

  def move_to_archive
    return unless can_be_archived? == true

    @archived = true
  end
end
