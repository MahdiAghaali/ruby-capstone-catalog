require_relative './author'

module AuthorActions
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
    if view_authors.empty?
      puts "<<< Author list empty >>>\n\n"
    else
      puts 'Authors List'
      view_authors.each do |element|
        puts "Id: #{element['id']} first_name: #{element['first_name']} last_name: #{element['last_name']}"
      end
    end
  end

  def create_author
    puts 'Enter first name?'
    first_name = gets.chomp
    puts 'Enter last name?'
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
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
end
