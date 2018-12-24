class TennisScore
  def initialize(player1, player2)
    @player1, @player2 = player1, player2
    @scores = { @player1 => 0, @player2 => 0}
    @lookup = { 0 => 'love',
                1 => 'fifteen',
                2 => 'thirty',
                3 => 'forty' }
    @done = false
  end

  def to_s
    if game_over?
      @done = true
      "Game #{leading_scorer}"
    elsif player1_score == 0 && player2_score == 0
      'Love all'
    elsif deuce?
      'Deuce'
    elsif relative_stage?
      "Advantage #{leading_scorer}"
    else
      "#{@player1} #{score_format(player1_score)}, #{@player2} #{score_format(player2_score)}"
    end
  end

  def score_left
    return if @done
    score(@player1)
  end

  def score_right
    return if @done
    score(@player2)
  end

  private

  def game_over?
    if relative_stage?
      (player1_score - player2_score).abs == 2
    else
      player1_score == 5 || player2_score == 5
    end
  end

  def score(player)
    @scores[player] += 1
    @done = true if game_over?
    @scores[player]
  end

  def score_format(score)
    @lookup[score]
  end

  def player1_score
    @scores[@player1]
  end

  def player2_score
    @scores[@player2]
  end

  def deuce?
    relative_stage? && tied?
  end

  def tied?
    player1_score == player2_score
  end

  def relative_stage?
    player1_score >= 3 && player2_score >= 3
  end

  def leading_scorer
    player1_score > player2_score ? @player1 : @player2
  end
end
