class DiceCup
  def initialize
    @dice = []

    6.times { @dice.push(:green_die) }
    4.times { @dice.push(:yellow_die) }
    3.times { @dice.push(:red_die) }

    @dice.shuffle!
  end

  def grab_dice
    grabbed_dice = []

    3.times { grabbed_dice.push(@dice.pop) }

    grabbed_dice
  end

  attr_reader :dice
end
