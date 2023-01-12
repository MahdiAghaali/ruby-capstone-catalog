require_relative './label'

class LabelOptions
  attr_accessor :list

  def initialize
    @list = []
  end

  def show_list
    puts "Available label in the catalog: #{@list.count}"
    @list.each_with_index do |label, index|
      puts "[#{index}] - Name: #{label.title}, Color: #{label.color}"
    end
  end

  def add_item
    print 'To add a new lable please enter the following parameters(type 0 to exit): '
    print 'title: '
    title = gets.chomp
    print 'color: '
    color = gets.chomp
    @list << Label.new(title, color)
    Storage.save_data('Label', @list)
    puts "\n Label created successfuly"
  end

  def select
    print 'do you want to create a new label (y/n)? '
    lable_choice = gets.chomp
    add_item if @list.empty? || lable_choice == 'y'
    show_list
  end
end
