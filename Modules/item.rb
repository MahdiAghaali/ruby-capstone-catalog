require 'date'

class Item
  private 
  attr_reader :id, :archived

  public
  attr_reader :genre, :author, :source, :label, :publish_date

  def inittialize(genre, author, source, label, date, archived)
    @id = Random.rand(1..10000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

end
