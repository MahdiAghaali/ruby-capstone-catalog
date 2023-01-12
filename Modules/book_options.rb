require_relative './book'

class BookOptions
  attr_accessor :list

  def initialize
    @list = []
  end

  def show_list
    if @list.empty?
      puts 'No record found! Add a book...'
    else
      puts "Available books in the catalog: #{@list.count}"
      @list.each_with_index do |book, index|
        puts "
          [#{index}] ------------
            Name: #{book.publisher},
            Author: #{book.author},
            Source: #{book.source},
            Label: #{book.label},
            Publisher: #{book.publisher}
            Cover State: #{book.cover_state}
          "
      end
    end
  end

  def add_item(label_options)
    print 'genre: '
    genre = gets.chomp

    print 'author: '
    author = gets.chomp

    print 'source: '
    source = gets.chomp

    print 'label id: '
    label_options.show_list
    label = gets.chomp

    print 'date(YYYY-MM-DD): '
    publish_date = gets.chomp

    print 'publisher: '
    publisher = gets.chomp

    print 'cover_state: '
    cover_state = gets.chomp

    @list << Book.new(genre, author, source, label, publish_date, publisher, cover_state)
    puts "\n book created successfuly"
  end
end
