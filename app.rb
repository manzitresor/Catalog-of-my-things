require_relative 'app_helper'
require 'json'
class App
  def initialize
    @books = []
    @labels = []
    @music_albums = []
    @genres = []
  end

  def display_data
    books = FileReader.new('./data/books.json').read
    labels = FileReader.new('./data/labels.json').read

    books.each do |book|
      @books.push(Book.new(book['publisher'], book['cover_state']))
    end
    labels.each do |label|
      @labels.push(Label.new(label['title'], label['color']))
    end
  end

  def preserve_data
    books = @books.map { |book| { publisher: book.publisher, cover_state: book.cover_state } }
    labels = @labels.map { |label| { title: label.title, color: label.color } }
    FileWriter.new('./data/books.json').write(books)
    FileWriter.new('./data/labels.json').write(labels)
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

  def list_all_movies
    puts 'empty method'
  end

  def list_all_games
    puts 'empty method'
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

  def add_a_movie
    puts 'empty method'
  end

  def add_a_game
    puts 'empty method'
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
    puts 'empty method'
  end

  def list_all_sources
    puts 'empty method'
  end

  def exit_app
    puts 'Goodbye'
    preserve_data
    exit
  end
end
