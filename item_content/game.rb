require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :author, :genre, :source, :label

  @game_list = []
  def initialize(multiplayer, last_played_at)
    super
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    self.class.game_list << self
  end

  class << self
    attr_accessor :game_list
  end
end
