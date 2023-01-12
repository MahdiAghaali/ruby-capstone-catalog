require_relative './Modules/book_options'
require_relative './Modules/label_options'
require_relative './Modules/game_options'
require_relative './Modules/storage'
require('./Modules/music_actions')
require('./Modules/genre_actions')
require('json')

class Main
  include Music
  include GenreAction
  def initialize
    @book_options = BookOptions.new
    @label_options = LabelOptions.new
    @game_options = GameOptions.new

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
    puts '3 -  Add new basic data'
    puts '0 -  Exit'
    user_choice = gets.chomp
    case user_choice
    when '1'
      show_list
    when '2'
      add_item
    when '3'
      add_data
    when '0'
      exit
    else
      puts 'That is an invalid input, Please try again.'
      show_menu
    end
  end

  def show_list
    puts "\nPlease choose an option by entering a number:"
    puts '1 - List all Movies'
    puts '2 - List all Games'
    puts '3 - List all Books'
    puts '4 - List all Music Album '
    puts '9 - Back'
    puts '0 - Exit'

    user_choice = gets.chomp
    case user_choice
    when '2'
      @game_options.show_list
    when '3'
      @book_options.show_list
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
    puts '1 - Add a new Movie'
    puts '2 - Add a new Game'
    puts '3 - Add a new Book'
    puts '4 - Add a new Music Album '
    puts '9 - Back'
    puts '0 - Exit'

    user_choice = gets.chomp
    case user_choice
    when '2'
      @game_options.add_item(@label_options)
      Storage.save_data('Game', @game_options.list)
    when '3'
      @book_options.add_item(@label_options)
      Storage.save_data('Book', @book_options.list)
    when '4'
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

  def add_data
    puts "\nPlease choose an option by entering a number:"
    puts '1 - List all genres'
    puts '2 - Add a new author'
    puts '3 - Add a new source'
    puts '4 - Add a new label'
    puts '9 - Back'
    puts '0 - Exit'

    user_choice = gets.chomp
    case user_choice
    when '4'
      @label_options.add_item
      Storage.save_data('Label', @label_options.list)
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
