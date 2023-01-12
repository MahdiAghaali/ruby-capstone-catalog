require_relative('./item')
require('securerandom')

class Author
  attr_accessor :first_name, :last_name, :item
  attr_reader :id

  def initialize(first_name, last_name, items = [])
    @id = SecureRandom.uuid
    @first_name = first_name
    @last_name = last_name
    @items = items
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end
