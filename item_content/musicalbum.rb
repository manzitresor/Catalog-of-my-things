require_relative 'item'

class MusicAlbum < Item
    attr_accessor :on_spotify
    def initialize(on_spotify)
        super("Music", "Unknown", "Unknown", "Unknown")
        @on_spotify = on_spotify
    end

    private

    def can_be_archieved?()
        parent_can_be_archived = super
        parent_can_be_archived && @on_spotify
    end
end