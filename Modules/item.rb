require 'date'
require 'securerandom'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :id, :archived

  def initialize(genre_in, author_in, source_in, label_in, publish_date_in)
    @id = SecureRandom.uuid
    @genre = genre_in
    @author = author_in
    @source = source_in
    @label = label_in
    @publish_date = publish_date_in
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
