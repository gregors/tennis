require_relative 'state_machine'
require_relative 'english_messages'

class TennisScore
  def initialize(player1, player2)
    @player1, @player2 = player1, player2
    @state = StateMachine.new

    # we could make this a dynamic lookup based on locale
    @translation = EnglishMessages.new(player1, player2)
  end

  def to_s
    @translation.msg @state.current
  end

  def score_left
    @state.left
  end

  def score_right
    @state.right
  end
end
