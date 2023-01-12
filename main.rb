require_relative './Modules/book_options'
require_relative './Modules/label_options'
require_relative './Modules/game_options'
require_relative './Modules/storage'
require('./Modules/music_actions')
require('./Modules/genre_actions')
require('./Modules/author_actions')
require('json')

class Main
  include Music
  include GenreAction
  def initialize
    @book_options = BookOptions.new
    @label_options = LabelOptions.new
    @game_options = GameOptions.new
    @author_options = AuthorActions.new

    @book_options.list = Storage.load_data('Book')
    @label_options.list = Storage.load_data('Label')
    @game_options.list = Storage.load_data('Game')

    puts "\n << WELCOME TO the Catalog of things >> \n"
    show_menu
  end

  def show_menu
    puts "\n Please choose an option by entering a number:"
    puts '1 -  View all lists'
    puts '2 -  Create new items'
    puts '0 -  Exit'
    user_choice = gets.chomp
    case user_choice
    when '1'
      show_list
    when '2'
      add_item
    when '0'
      exit
    else
      puts 'That is an invalid input, Please try again.'
      show_menu
    end
  end

  def show_list
    puts "\nPlease choose an option by entering a number:"
    puts '1 - List all Games'
    puts '2 - List all Books'
    puts '3 - List all Music Album '
    puts '9 - Back'
    puts '0 - Exit'

    user_choice = gets.chomp
    case user_choice
    when '1'
      @game_options.show_list
    when '2'
      @book_options.show_list
    when '3'
      show_musicalbum
    when '9'
      show_menu
    when '0'
      exit
    else
      puts 'That is an invalid input, Please try again.'
      add_item
    end
    show_menu
  end

  def add_item
    puts "\nPlease choose an option by entering a number:"
    puts '1 - Add a new Game'
    puts '2 - Add a new Book'
    puts '3 - Add a new Music Album '
    puts '9 - Back'
    puts '0 - Exit'

    user_choice = gets.chomp
    case user_choice
    when '1'
      @game_options.add_item(@label_options, @author_options)
      Storage.save_data('Game', @game_options.list)
    when '2'
      @book_options.add_item(@label_options, @author_options)
      Storage.save_data('Book', @book_options.list)
    when '3'
      create_musicalbum
    when '9'
      show_menu
    when '0'
      exit
    else
      puts 'That is an invalid input, Please try again.'
      add_item
    end
    show_menu
  end

  def exit
    puts 'Thank you for using the app, see you later!'
  end
end
