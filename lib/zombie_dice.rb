require 'zombie_dice/version'

module ZombieDice
  def roll_die(die)
    roll = Kernel.rand(6)

    if die == :green_die
      if roll.between?(0, 2)
        return :brain
      elsif roll.between?(3, 4)
        return :runner
      elsif roll == 5
        return :shotgun
      end
    elsif die == :yellow_die
      if roll.between?(0, 1)
        return :brain
      elsif roll.between?(2, 3)
        return :runner
      elsif roll.between?(4, 5)
        return :shotgun
      end
    elsif die == :red_die
      if roll == 0
        return :brain
      elsif roll.between?(1, 2)
        return :runner
      elsif roll.between?(3, 5)
        return :shotgun
      end
    end
  end
end
