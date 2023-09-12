require_relative '../app_helper'
class Book < Item
  attr_accessor :publisher, :cover_state, :publish_date

  def initialize(publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
  end

  private

  def can_be_archived?
    super|| @cover_state == 'bad'
  end
end
