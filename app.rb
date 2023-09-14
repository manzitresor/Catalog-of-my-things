require_relative 'app_helper'
require 'json'
class App
  def initialize
    @books = []
    @labels = []
    @authors = []
    @games = []
    @music_albums = []
    @genres = []
  end

  # rubocop:disable Metrics/MethodLength
  def display_data
    books = FileReader.new('./data/books.json').read
    labels = FileReader.new('./data/labels.json').read
    books.each do |book|
      @books.push(Book.new(book['publisher'], book['cover_state']))
    end
    labels.each do |label|
      @labels.push(Label.new(label['title'], label['color']))
    end
    authors = FileReader.new('./data/authors.json').read
    games = FileReader.new('./data/games.json').read
    games.each do |game|
      @games.push(Game.new(game['multiplayer'], game['last_played_at']))
    end
    authors.each do |author|
      @authors.push(Author.new(author['first_name'], author['last_name']))
    end
    musicalbum = FileReader.new('./data/musicalbum.json').read
    genre_data = FileReader.new('./data/genre.json').read
    musicalbum.each do |music|
      @music_albums.push(MusicAlbum.new(music['publish_date'], music['on_spotify'], music['title'], music['artist']))
    end
    genre_data.each do |genre|
      @genres.push(Genre.new(genre['name']))
    end
  end

  # rubocop:enable Metrics/MethodLength
  def preserve_data
    books = @books.map { |book| { publisher: book.publisher, cover_state: book.cover_state } }
    labels = @labels.map { |label| { title: label.title, color: label.color } }
    FileWriter.new('./data/books.json').write(books)
    FileWriter.new('./data/labels.json').write(labels)
    games = @games.map { |game| { multiplayer: game.multiplayer, last_played_at: game.last_played_at } }
    authors = @authors.map { |author| { first_name: author.first_name, last_name: author.last_name } }
    FileWriter.new('./data/authors.json').write(authors)
    FileWriter.new('./data/games.json').write(games)
    album = @music_albums.map do |m|
      {
        publish_date: m.publish_date,
        on_spotify: m.on_spotify,
        title: m.title, artist: m.artist
      }
    end
    genre = @genres.map { |g| { id: g.id, name: g.name } }
    FileWriter.new('./data/musicalbum.json').write(album)
    FileWriter.new('./data/genre.json').write(genre)
  end

  def list_all_books
    @books.each do |book|
      puts "Pubisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
  end

  def list_all_music_album
    puts "List of All Music Albums: \n"
    @music_albums.each do |music|
      puts "ID: #{music.id}, title: #{music.title}, author: #{music.author}, Is it on Spotify: #{music.on_spotify}"
    end
  end

  def list_all_games
    @games.each do |game|
      puts "Multiplayer?: #{game.multiplayer}, Last Played At: #{game.last_played_at}"
    end
  end

  def add_a_book
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state: '
    cover_state = gets.chomp
    puts 'Create a New Label'
    add_label
    book = Book.new(publisher, cover_state)
    @books.push(book)
    puts 'Book created successfullly'
  end

  def add_label
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    label = Label.new(title, color)
    @labels.push(label)
  end

  def add_a_music_album
    print 'Enter music album title: '
    title = gets.chomp

    print 'Enter music album artist: '
    artist = gets.chomp

    print 'Enter music album release date (YYYY-MM-DD): '
    release_date_str = gets.chomp
    release_date = Date.parse(release_date_str)

    print 'Is it on Spotify? (true/false): '
    on_spotify = gets.chomp.downcase == 'true'
    add_genre
    music_album = MusicAlbum.new(release_date, on_spotify, title, artist)
    @music_albums << music_album
    puts 'Music album added successfully!'
  end

  def add_genre
    print 'Enter music album genre: '
    genre_name = gets.chomp

    genre_data = Genre.new(genre_name)
    @genres << genre_data
  end

  def add_a_game
    print 'Is the game a multiplayer game? (yes or no):'
    input = gets.chomp
    multiplayer = input.downcase == 'yes'
    print 'Last played at:'
    last_played_at = gets.chomp.to_i
    add_author
    game = Game.new(multiplayer, last_played_at)
    @games.push(game)
    puts 'Game created successfullly'
  end

  def add_author
    print 'First Name: '
    first_name = gets.chomp
    print 'Last Name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors.push(author)
  end

  def list_all_genres
    puts "List of Genres: \n"
    @genres.each do |genre|
      puts "ID: #{genre.id}, name: #{genre.name}"
    end
  end

  def list_all_labels
    @labels.each do |label|
      puts "Title: #{label.title}, Color: #{label.color}"
    end
  end

  def list_all_authors
    @authors.each do |author|
      puts "First Name: #{author.first_name}, Last Name: #{author.last_name}"
    end
  end

  def exit_app
    puts 'Goodbye'
    preserve_data
    exit
  end
end
