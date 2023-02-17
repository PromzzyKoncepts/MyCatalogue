require_relative './helper_spec'

describe Genre do
  before :each do
    @music = MusicAlbum.new('Happy Day', '2000', false)
    @genre = Genre.new('Blues')
    @genre.add_item(@music)
  end

  context 'Genre class' do
    it 'Should be an instance of the MusicAlbum class' do
      expect(@genre).to be_an_instance_of(Genre)
    end

    it 'Should have one property' do
      expect(@genre).to have_attributes(name: 'Blues')
    end

    it 'Should have genre property of Blues' do
      expect(@music.genre.name).to eq('Blues')
    end
  end
end
