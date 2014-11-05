require 'zombie_dice/player'

describe Player do
  describe '#initialize' do
    it 'initializes brains to 0' do
      player = Player.new("Test")
      expect(player.brains).to eq(0)
    end

    it 'initializes shots to 0' do
      player = Player.new("T")
      expect(player.shots).to eq(0)
    end
  end
end
