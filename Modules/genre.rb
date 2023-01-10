require('securerandom')

class Genre
  attr_accessor :id, :name, :items
  def initialize(name,items=[])
    @id = SecureRandom.uuid
    @name =name
    @items = items
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

end