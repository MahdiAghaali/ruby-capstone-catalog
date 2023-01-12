require_relative './author'

class AuthorActions
  attr_accessor :author_array

  def initialize
    @author_array = []
  end

  def view_author
    if File.exist?('./data/author.json')
      files = File.open('./data/author.json', 'r')
      JSON.parse(files.read)
    else
      File.open('./data/author.json', 'w') do |_file|
        File.write('./data/author.json', [])
      end
      []
    end
  end

  def show_authors
    if @author_array.empty?
      puts "<<< Author list empty >>>\n\n"
    else
      puts 'Authors List'
      @author_array.each_with_index do |element, index|
        puts "Id: #{index} first_name: #{element.first_name} last_name: #{element.last_name}"
      end
    end
  end

  def create_author
    puts 'Enter first name?'
    first_name = gets.chomp
    puts 'Enter last name?'
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
    @author_array << new_author
    data = {
      id: new_author.id,
      first_name: new_author.first_name,
      last_name: new_author.last_name
    }
    store_author(data)
    puts 'Author created successfully'
  end

  def store_author(obj)
    @authors = view_author
    @authors << obj unless @authors.include? obj
    File.open('./data/author.json', 'w') do |_file|
      File.write('./data/author.json', JSON.pretty_generate(@authors))
    end
  end

  def select
    print 'do you want to create a new Author (y/n)? '
    author_choice = gets.chomp
    create_author if author_choice == 'y'
    show_authors
  end
end
