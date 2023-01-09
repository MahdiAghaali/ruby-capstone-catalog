class Main
  def initialize
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
      "That is an invalid input, Please try again."
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
    return exit if user_choice == '0'
    show_menu if user_choice == '9'
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
    return exit if user_choice == '0'
    show_menu if user_choice == '9'

  end

  def add_data
    puts "\nPlease choose an option by entering a number:"
    puts '1 - Add a new genre'
    puts '2 - Add a new author'
    puts '3 - Add a new source'
    puts '4 - Add a new label'
    puts '9 - Back'
    puts '0 - Exit'
    user_choice = gets.chomp
    return exit if user_choice == '0'
    show_menu if user_choice == '9'

  end

  def exit
    puts 'Thank you for using the app, see you later!'
  end
end