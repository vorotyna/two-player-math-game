class Player 
attr_accessor :name, :id, :life, :players_turn, :score

  def initialize(name, id)
    @name = name
    @id = id
    @life = 3
    @players_turn = false
    @score = 0
  end 
end

