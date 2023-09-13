require_relative '../app_helper'

describe('Initialize parameters') do
  @game = Game.new('Yes', '2023/02/04')
  it 'throws an argumentError when given less than 2 arguments' do
    expect { Game.new 'First Argument' }.to raise_error(ArgumentError)
  end

  it 'should be correctly initialized' do
    @game = Game.new('Yes', '2023/02/04')
    expect(@game.multiplayer).to eq('Yes')
    expect(@game.last_played_at).to eq('2023/02/04')
  end
end
