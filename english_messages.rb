class EnglishMessages

  def initialize(player1, player2)
    @player1, @player2 = player1, player2
    @states = {
      love_all: 'Love all',
      _15_love: "#{@player1} fifteen, #{@player2} love",
      _30_love: "#{@player1} thirty, #{@player2} love",
      _40_love: "#{@player1} forty, #{@player2} love",
      _love_15: "#{@player1} love, #{@player2} fifteen",
      _love_30: "#{@player1} love, #{@player2} thirty",
      _love_40: "#{@player1} love, #{@player2} forty",
      _15_15: "#{@player1} fifteen, #{@player2} fifteen",
      _30_15: "#{@player1} thirty, #{@player2} fifteen",
      _15_30: "#{@player1} fifteen, #{@player2} thirty",
      _40_15: "#{@player1} forty, #{@player2} fifteen",
      _15_40: "#{@player1} fifteen, #{@player2} forty",

      _30_30: "#{@player1} thirty, #{@player2} thirty",
      _30_40: "#{@player1} thirty, #{@player2} forty",
      _40_30: "#{@player1} forty, #{@player2} thirty",

      deuce: 'Deuce',
      advantage_1: "Advantage #{@player1}",
      advantage_2: "Advantage #{@player2}",
      game_1: "Game #{@player1}",
      game_2: "Game #{@player2}",
    }
  end

  def msg(state)
    @states[state]
  end
end
