require('json')
require_relative('./genre')
require_relative './music_actions'
module GenreAction
  # include MusicAction
  def view_genres
    if File.exist?('./data/genre.json')
      files = File.open('./data/genre.json', 'r')
      JSON.parse(files.read)

    else
      File.open('./data/genre.json', 'w') do |_file|
        File.write('./data/genre.json', [])
      end
      []
    end
  end

  def show_genres
    if view_genres.empty?
      puts "<<< Genre list empty >>>\n\n"
    else
      puts 'Genres List'
      view_genres.each do |element|
        puts "Id: #{element['id']} Name: #{element['name']}"
      end
    end
  end

  def all_genre(new_music)
    @list = view_genres
    if @list.empty?
      puts '<<There is no genre available, choose an optiob below to continue'
      puts '1) Continue without a genre'
      puts '2) Create a new genre'
      user_choice = gets.chomp
      case user_choice
      when '1'
        music_genre(new_music, nil)
      when '2'
        id = create_genre
        music_genre(new_music, id)
      else
        puts 'That is an invalid input, Please try again.'
        all_genre
      end
    else
      puts 'Genres List'
      puts 'Please enter the ID of the genre you want to add or  0 to create a new genre'
      @list.each_with_index { |element, _index| puts "ID: #{element['id']} Name: #{element['name']}" }
      puts ' '
      puts '0) Create new Genre'
      user_choice = gets.chomp
      if user_choice == '0'
        id = create_genre
        music_genre(new_music, id)
      else
        music_genre(new_music, user_choice)
      end
    end
  end

  def music_genre(new_music, id)
    data = {
      id: new_music.id,
      publish_date: new_music.publish_date,
      on_spotify: new_music.on_spotify,
      genre_id: id
    }
    store_music(data)
    puts 'New music album created successfully'
  end

  def create_genre
    puts 'What is the name of the genre?'
    res = gets.chomp
    new_genre = Genre.new(res)
    data = {
      id: new_genre.id,
      name: new_genre.name
    }
    store_genre(data)
    puts 'Genre created successfully'
    new_genre.id
  end

  def store_genre(obj)
    @genres = view_genres
    @genres << obj unless @genres.include? obj
    File.open('./data/genre.json', 'w') do |_file|
      File.write('./data/genre.json', JSON.pretty_generate(@genres))
    end
  end
end
