require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :author, :genre, :source, :label

  def initialize(multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    self.class.can_be_archived? && @last_played_at > 2
  end

  class << self
    attr_accessor :game_list
  end
end
