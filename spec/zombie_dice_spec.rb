require 'spec_helper'
require 'zombie_dice'

describe ZombieDice do
  include ZombieDice

  describe '#roll_die' do
    def die_roll_helper(color, expected_return_value, expected_num_of_return)
        returned_values = []

        6.times do |i|
          allow(Kernel).to receive(:rand).and_return(i)

          returned_values.push roll_die(color)
        end

        num_of_expected_returns = 0

        returned_values.each do |value|
          if value == expected_return_value
            num_of_expected_returns += 1
          end
        end

        expect(num_of_expected_returns).to eq(expected_num_of_return)
    end

    context 'with green die' do
      it 'has 3 in 6 change of rolling a brain' do
        die_roll_helper(:green, :brain, 3)
      end

      it 'has 2 in 6 chance of rolling a runner' do
        die_roll_helper(:green, :runner, 2)
      end

      it 'has 1 in 6 change of rolling a shotgun' do
        die_roll_helper(:green, :shotgun, 1)
      end
    end

    context 'with yellow die' do
      it 'has an even chance of rolling a brain, shotgun, or runner' do
        die_roll_helper(:yellow, :brain, 2)
        die_roll_helper(:yellow, :runner, 2)
        die_roll_helper(:yellow, :shotgun, 2)
       end
    end

    context 'with red die' do
      it 'has 1 in 3 chance of rolling a brain' do
        die_roll_helper(:red, :brain, 1)
      end

      it 'has 2 in 6 chance of rolling a runner' do
        die_roll_helper(:red, :runner, 2)
      end

      it 'has 3 in 6 chance of rolling a shotgun' do
        die_roll_helper(:red, :shotgun, 3)
      end
    end
  end
end
