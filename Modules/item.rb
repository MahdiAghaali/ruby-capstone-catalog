require 'date'
require 'securerandom'

class Item
  private

  attr_reader :id, :archived

  public

  attr_reader :genre, :author, :source, :label, :publish_date

  def inittialize(genre, author, source, label, publish_date)
    @id = SecureRandom.uuid
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    now = Date.today
    before = Date.parse(@publish_date)
    difference_in_days = (now - before).to_i
    return true if (difference_in_days / 365.25).to_i > 10

    false
  end

  def move_to_archive
    @archived = true if can_be_archived?
    nil
  end

  def genres=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def authors=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end
end
