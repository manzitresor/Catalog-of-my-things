require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :title, :artist
  attr_reader :id

  def initialize(publish_date, on_spotify, title, artist)
    super(publish_date)
    @on_spotify = on_spotify
    @publish_date = publish_date
    @title = title
    @artist = artist
    @id = Random.rand(1..1000)
  end

  private

  def can_be_archieved?
    parent_can_be_archived = super
    parent_can_be_archived && @on_spotify
  end
end
