require_relative 'app'
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
def main
  app = App.new
  app.display_data
  response = nil
  while response != '13'
    response = prompter
    case response
    when '1'
      app.list_all_books
    when '2'
      app.list_all_music_album
    when '3'
      app.list_all_games
    when '4'
      app.list_all_genres
    when '5'
      app.list_all_labels
    when '6'
      app.list_all_authors
    when '7'
      app.add_a_book
    when '8'
      app.add_a_music_album
    when '9'
      app.add_a_game
    when '10' then app.exit_app
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
  puts '3 - list all games'
  puts '4 - List all genres'
  puts '5 - List all labels'
  puts '6 - List all authors'
  puts '7 - Add a book'
  puts '8 - Add a music album'
  puts '9 - Add a game'
  puts '10 - Exit'
  gets.chomp
end

main
