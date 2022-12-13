class Game 
  attr_accessor :player1, :player2, :turn

  def initialize()
    @player1 = Player.new("Player 1", 1)
    @player1.players_turn = true # Sets player 1 to be the first turn
    
    @player2 = Player.new("Player 2", 2)
  end

  def start_game()
    puts "Welcome to the Math Game! \nLet's begin with #{whos_turn.name}."
  end

  def whos_turn()
    player1.players_turn ? player1 : player2
  end


  def switch_turns()
    player1.players_turn = !player1.players_turn
    player2.players_turn = !player2.players_turn
  end


  def new_turn()
    if player1.life == 0 || player2.life == 0
      switch_turns
      end_game
    else
      switch_turns
      puts "\n ----- NEW TURN -----"
      play
    end
  end


  def end_game()
    puts "\n#{whos_turn.name} wins with a score of #{whos_turn.life}/3"
    puts "----- GAME OVER ----- \nGoodbye!"
  end


  def play()
    question = Question.new

    puts "\n#{whos_turn.name}: What does #{question.num1} plus #{question.num2} equal?"
    print "> "
    player_answer = gets.chomp.to_i

    if player_answer != question.sum
      puts "#{whos_turn.name}: Seriously? No!"
      whos_turn.life -= 1
    else
      puts "#{whos_turn.name}: YES! You are correct."
    end

    puts "P#{player1.id}: #{player1.life}/3 vs P#{player2.id}: #{player2.life}/3"

    new_turn
  end
end
