
require_relative '../item_content/musicalbum' 

RSpec.describe MusicAlbum do
  describe '#initialize' do
    it 'initializes a music album with on_spotify attribute' do
      music_album = MusicAlbum.new(true)
      expect(music_album.genre).to eq('Music')
      expect(music_album.author).to eq('Unknown')
      expect(music_album.source).to eq('Unknown')
      expect(music_album.label).to eq('Unknown')
      expect(music_album.on_spotify).to be true
    end
  end

  describe '#move_to_archive' do
    it 'moves a music album to the archive if it can be archived' do
      music_album = MusicAlbum.new(true)
      music_album.move_to_archive
      expect(music_album.instance_variable_get(:@archived)).to be true
    end

    it 'does not move a music album to the archive if it cannot be archived' do
      music_album = MusicAlbum.new(false)
      music_album.move_to_archive
      expect(music_album.instance_variable_get(:@archived)).to be true
    end
  end
end
