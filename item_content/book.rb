require_relative '../app_helper'
class Book < Item
    attr_accessor :publisher, :cover_state
    def initialize(publisher,cover_state)
        super(publish_date)
        @publisher = publisher
        @cover_state = cover_state
    end
    private
    def can_be_archieved?()
        super | @cover_state == 'bad'
    end
end