require 'spec_helper'
require 'zombie_dice/dice_cup'

describe DiceCup do
  before(:all) do
    @cup = DiceCup.new
  end

  describe '#initialize' do
    it 'should have 6 green dice' do
      expect(@cup.dice.count(:green_die)).to eq(6)
    end
    
    it 'should have 4 yellow dice' do
      expect(@cup.dice.count(:yellow_die)).to eq(4)
    end

    it 'should have 3 red dice' do
      expect(@cup.dice.count(:red_die)).to eq(3)
    end

    it 'should have 13 dice total' do
      expect(@cup.dice.length).to eq(13)
    end
  end

  describe '#grab_dice' do
    before(:all) do
      @grabbed_dice = @cup.grab_dice
    end

    it 'should return an array of three dice' do
      expect(@grabbed_dice).to be_a(Array)
      expect(@grabbed_dice.length).to eq(3)
      
      @grabbed_dice.each do |die| 
	expect(die).to eq(:green_die).or eq(:yellow_die).or eq(:red_die)
      end
    end

    it 'should remove grabbed dice from cup' do
      cup = DiceCup.new
      original_dice = cup.dice.dup
      grabbed_dice = cup.grab_dice
      
      expect(original_dice.length).to eq(grabbed_dice.length + cup.dice.length)
      
      expect(original_dice.count(:green_die)).to eq(grabbed_dice.count(:green_die) + cup.dice.count(:green_die))
      expect(original_dice.count(:yellow_die)).to eq(grabbed_dice.count(:yellow_die) + cup.dice.count(:yellow_die))
      expect(original_dice.count(:red_die)).to eq(grabbed_dice.count(:red_die) + cup.dice.count(:red_die))
    end
  end
end
