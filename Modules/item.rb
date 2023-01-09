require 'date'

class Item
  private

  attr_reader :id, :archived

  public

  attr_reader :genre, :author, :source, :label, :publish_date

  def inittialize(genre, author, source, label, _date)
    @id = Random.rand(1..10_000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = true
  end
end
