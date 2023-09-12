require_relative 'app'
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
def main
  app = App.new
  response = nil
  while response != '13'
    response = prompter
    case response
    when '1'
      app.list_all_books
    when '2'
      app.list_all_music_album
    when '3'
      app.list_all_movies
    when '4'
      app.list_all_games
    when '5'
      app.list_all_genres
    when '6'
      app.list_all_labels
    when '7'
      app.list_all_authors
    when '8'
      app.list_all_sources
    when '9'
      app.add_a_book
    when '10'
      app.add_a_music_album
    when '11'
      app.add_a_movie
    when '12'
      app.add_a_game
    when '13' then app.exit_app
    end
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength
def prompter
  puts ' '
  puts 'Welcome to Catalog App!'
  puts 'Please choose an option by entering a number:'
  puts '1 - list all books'
  puts '2 - list all music album'
  puts '3 - list all movies'
  puts '4 - list all games'
  puts '5 - List all genres'
  puts '6 - List all labels'
  puts '7 - List all authors'
  puts '8 - List all sources'
  puts '9 - Add a book'
  puts '10 - Add a music album'
  puts '11 - Add a movie'
  puts '12 - Add a game'
  puts '13 - Exit'
  gets.chomp
end

main
