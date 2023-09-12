require_relative 'app_helper'
require 'json'
class App
  def initialize
    @books = []
  end

  def list_all_books
    @books.each do |book|
      puts "Pubisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
  end

  def list_all_music_album
    puts 'empty method'
  end

  def list_all_movies
    puts 'empty method'
  end

  def list_all_games
    puts 'empty method'
  end

  def add_a_book
    print "Publisher: "
    publisher = gets.chomp
    print "Cover state: "
    cover_state = gets.chomp
    book = Book.new(publisher,cover_state)
    @books.push(book)
    puts ""
    puts "Book created successfullly"
  end

  def add_a_music_album
    puts 'empty method'
  end

  def add_a_movie
    puts 'empty method'
  end

  def add_a_game
    puts 'empty method'
  end

  def list_all_genres
    puts 'empty method'
  end

  def list_all_labels
    puts 'empty method'
  end

  def list_all_authors
    puts 'empty method'
  end

  def list_all_sources
    puts 'empty method'
  end

  def exit_app
    puts 'Goodbye'
    exit
  end
end
