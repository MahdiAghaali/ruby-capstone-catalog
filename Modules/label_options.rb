require_relative './label'

class LabelOptions
  attr_accessor :list

  def initialize
    @list = []
  end

  def show_list
    if @list.empty?
      puts 'No record found! Add a label...'
    else
      puts "Available label in the catalog: #{@list.count}"
      @list.each_with_index do |label, index|
        puts "[#{index}] - Name: #{label.title}, Color: #{label.color}"
      end
    end
  end

  def add_item
    print 'title: '
    title = gets.chomp
    print 'color: '
    color = gets.chomp

    @list << Label.new(title, color)
    puts "\n Label created successfuly"
  end
end
