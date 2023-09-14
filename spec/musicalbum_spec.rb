require_relative '../item_content/musicalbum'

RSpec.describe MusicAlbum do
  let(:publish_date) { '2023-09-14' }
  let(:on_spotify) { true }
  let(:title) { 'Album Title' }
  let(:artist) { 'Artist Name' }

  describe '#initialize' do
    it 'initializes a music album with the correct attributes' do
      music_album = MusicAlbum.new(publish_date, true, title, artist)

      expect(music_album.publish_date).to eq(publish_date)
      expect(music_album.on_spotify).to be true
      expect(music_album.title).to eq(title)
      expect(music_album.artist).to eq(artist)
    end

    it 'generates a random ID for the music album' do
      music_album1 = MusicAlbum.new(publish_date, on_spotify, title, artist)
      music_album2 = MusicAlbum.new(publish_date, on_spotify, title, artist)

      expect(music_album1.id).not_to eq(music_album2.id)
    end
  end

  
end
