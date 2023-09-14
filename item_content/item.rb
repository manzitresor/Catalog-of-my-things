require 'date'
class Item
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(publish_date, source: nil, archived: true)
    @id = Random.rand(1..1000)
    @genre = nil
    @author = nil
    @label = nil
    @source = source
    @publish_date = Date.today || publish_date
    @archived = archived
  end

  private

  def can_be_archived?
    today = Date.today
    ten_years_ago = Date.new(today.year - 10, today.month, today.day)

    @publish_date > ten_years_ago
  end

  public

  def move_to_archive
    return unless can_be_archived? == true

    @archived = true
  end
end
