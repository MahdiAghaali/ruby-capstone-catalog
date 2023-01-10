require('securerandom')

class Genre
  attr_accessor :id, :name, :item
  def initialize(name,item=[])
    @id = SecureRandom.uuid
    @name =name
    @item = item
  end
end