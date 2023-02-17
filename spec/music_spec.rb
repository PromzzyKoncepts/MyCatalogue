require_relative './helper_spec'

describe MusicAlbum do
  before :each do
    @music = MusicAlbum.new('Happy Day', '2000', false)
  end

  context 'MusicAlbum class' do
    it 'Should be an instance of the MusicAlbum class' do
      expect(@music).to be_an_instance_of(MusicAlbum)
    end

    it 'Should have three properties' do
      expect(@music).to have_attributes(name: 'Happy Day', publish_date: '2000', on_spotify: false)
    end

    it 'Should return false' do
      expect(@music.can_be_archived?).to be false
    end
  end
end
