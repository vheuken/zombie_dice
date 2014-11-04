require 'zombie_dice/version'

module ZombieDice
  def roll_die(dice)
    roll = Kernel.rand(6)

    if dice == :green
      if roll.between?(0, 2)
        return :brain
      elsif roll.between?(3, 4)
        return :runner
      elsif roll == 5
        return :shotgun
      end
    elsif dice == :yellow
      if roll.between?(0, 1)
        return :brain
      elsif roll.between?(2, 3)
        return :runner
      elsif roll.between?(4, 5)
        return :shotgun
      end
    elsif dice == :red
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
