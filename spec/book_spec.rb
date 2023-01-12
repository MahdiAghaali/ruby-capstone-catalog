require('./Modules/book')

describe 'Testing Book functions' do
  before(:each) do
    @new_book = Book.new('genre', 'author', 'source', 'label', '2020-12-12', 'publisher', 'bad')
  end

  it 'Returns the instance of class' do
    expect(@new_book).to be_instance_of Book
  end

  it 'Return the name of the Genre instance' do
    expect(@new_book.genre).to eql 'genre'
  end

  it 'Return true if cover_state is bad' do
    expect(@new_book.can_be_archived?).to eql true
  end
end
