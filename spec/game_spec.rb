require_relative './helper_spec'
require 'date'

describe Game do
  before :all do
    @game = Game.new('Fortnite', true, '2000')
  end

  context 'game object'
  it 'Should create a new game' do
    expect(@game).to be_instance_of Game
  end

  it 'should return be a multiplayer, name and lastplayedat game' do
    expect(@game.multiplayer).to be_truthy
    expect(@game.last_played_at).to be 2000
    expect(@game.name).to eq 'Fortnite'
  end

  it 'should test for can_be_archived' do
    expect(@game.can_be_archived?).to be_truthy
  end
end
