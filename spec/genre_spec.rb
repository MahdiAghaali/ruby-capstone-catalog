require('./Modules/genre')

describe 'Testing Music Album functions' do
  before(:each) do
    @new_genre = Genre.new('Mohi')
  end

  it 'Returns the instance of class' do
    expect(@new_genre).to be_instance_of Genre
  end

  it 'Return the name of the Genre instance' do
    expect(@new_genre.name).to eql 'Mohi'
  end

  it 'Return the id should be in range of 1-1000' do
    expect(@new_genre.id).to be_between(1, 1000)
  end
end
