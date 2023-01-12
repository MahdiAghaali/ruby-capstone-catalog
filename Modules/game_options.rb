require_relative './book'

class GameOptions
  attr_accessor :list

  def initialize
    @list = []
  end

  def show_list
    if @list.empty?
      puts 'No record found! Add a game...'
    else
      puts "Available games in the catalog: #{list.count}"
      @list.each_with_index do |game, index|
        puts "[#{index}] Name: #{game.publisher}, ID: #{game.id}, author: #{game.author}"
      end
    end
  end

  def add_item(label_options, author_options)
    print 'genre: '
    genre = gets.chomp

    print 'author: '
    author_options.select
    author = gets.chomp

    print 'source: '
    source = gets.chomp

    print 'label: '
    label_options.select
    label = gets.chomp

    print 'date(YYYY-MM-DD): '
    publish_date = gets.chomp

    print 'multiplayer: '
    multiplayer = gets.chomp

    print 'last_played_at: '
    last_played_at = gets.chomp

    @list << Book.new(genre, author, source, label, publish_date, multiplayer, last_played_at)
    puts "\n book created successfuly"
  end
end
