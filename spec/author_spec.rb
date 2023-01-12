require('./Modules/author')

describe 'Testing Author Album functions' do
  before(:each) do
    @new_author = Author.new('Igiee', 'Aria')
  end

  it 'Returns the instance of class' do
    expect(@new_author).to be_instance_of Author
  end

  it 'Return the first name of the Author instance' do
    expect(@new_author.first_name).to eql 'Igiee'
  end

  it 'Return the last name of the Author instance' do
    expect(@new_author.last_name).to eql 'Aria'
  end

  it 'Return the id should be in range of 1-1000' do
    expect(@new_author.id.length).to eql 36
  end
end
