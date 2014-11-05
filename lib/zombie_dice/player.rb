class Player
  attr_reader :name, :brains, :shots

  def initialize(name)
    @name = name
    @brains = 0
    @shots = 0
  end
end
