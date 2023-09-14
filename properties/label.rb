require_relative '../app_helper'

class Label < Item
  attr_accessor :title, :color, :items

  def initialize(title, color)
    super(publish_date)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item=(item)
    @items << item unless @items.include?(item)
  end
end
