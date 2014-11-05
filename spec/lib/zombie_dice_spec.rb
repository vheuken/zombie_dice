require 'spec_helper'
require 'zombie_dice'

describe ZombieDice do
  before(:all) do
    @zombie_dice = ZombieDice::Game.new
  end

  describe '#start_game' do
    it 'initializes list of players' do
      @zombie_dice.start_game

      expect(@zombie_dice.players).to be_a(Array)
      expect(@zombie_dice.players.count).to eq(0)
    end
  end

  describe '#add_player' do
    it 'adds player to list' do
      player_name = 'Player1'
      @zombie_dice.add_player(player_name)

      @zombie_dice.players.select { |player| player.name == player_name }
    end
  end

  describe '#roll_die' do
    def die_roll_helper(color, expected_return_value, expected_num_of_return)
        returned_values = []

        6.times do |i|
          allow(Kernel).to receive(:rand).and_return(i)

          returned_values.push @zombie_dice.roll_die(color)
        end

        num_of_expected_returns = 0

        returned_values.each do |value|
          p
          if value == expected_return_value
            num_of_expected_returns += 1
          end
        end

        expect(num_of_expected_returns).to eq(expected_num_of_return)
    end

    context 'with green die' do
      it 'has 3 in 6 change of rolling a brain' do
        die_roll_helper(:green_die, :brain, 3)
      end

      it 'has 2 in 6 chance of rolling a runner' do
        die_roll_helper(:green_die, :runner, 2)
      end

      it 'has 1 in 6 change of rolling a shotgun' do
        die_roll_helper(:green_die, :shotgun, 1)
      end
    end

    context 'with yellow die' do
      it 'has an even chance of rolling a brain, shotgun, or runner' do
        die_roll_helper(:yellow_die, :brain, 2)
        die_roll_helper(:yellow_die, :runner, 2)
        die_roll_helper(:yellow_die, :shotgun, 2)
       end
    end

    context 'with red die' do
      it 'has 1 in 3 chance of rolling a brain' do
        die_roll_helper(:red_die, :brain, 1)
      end

      it 'has 2 in 6 chance of rolling a runner' do
        die_roll_helper(:red_die, :runner, 2)
      end

      it 'has 3 in 6 chance of rolling a shotgun' do
        die_roll_helper(:red_die, :shotgun, 3)
      end
    end
  end
end
