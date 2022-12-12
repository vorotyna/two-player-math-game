class Player 
attr_accessor :name, :life, :player_turn, :score

  def initialize(name)
    @name = name
    @life = 3
    @players_turn = false
    @score = 0
  end 
end

