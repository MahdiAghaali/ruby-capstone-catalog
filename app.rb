require('./Modules/author')

describe 'Testing Author Album functions' do
  before(:each) do
    @new_author = Author.new('Igiee', 'Aria')
  end

  it 'Returns the instance of class' do
    expect(@new_author).to be_instance_of Author
  end

  it 'Return the first name' do
    expect(@new_genre.first_name).to eql 'Igiee'
  end

  it 'Return the last name' do
    expect(@new_genre.last_name).to eql 'Aria'
  end

  it 'Return the id should be in range of 1-1000' do
    expect(@new_genre.id.length).to eql 36
  end
end
