require_relative 'app'
def main
  app = App.new
  app.display_data
  loop do
    prompter
    response = gets.chomp.to_i
    responses = {
      1 => -> { app.list_all_books }, 2 => -> { app.list_all_music_album }, 3 => -> { app.list_all_games },
      4 => -> { app.list_all_genres },
      5 => -> { app.list_all_labels },
      6 => -> { app.list_all_authors },
      7 => -> { app.add_book },
      8 => -> { app.add_music_album },
      9 => -> { app.add_game },
      10 => -> { app.exit_app }
    }
    case response
    when 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
      responses[response].call
    end
  end
end

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
end

main
