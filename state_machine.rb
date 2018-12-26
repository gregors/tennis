class StateMachine
  attr_reader :current

  def initialize
    @states = {}
    @states[:love_all] = [:_15_love, :_love_15]

    @states[:_15_love] = [:_30_love, :_15_15]
    @states[:_30_love] = [:_40_love, :_30_15]
    @states[:_40_love] = [:game_1, :_40_15]

    @states[:_love_15] = [:_15_15, :_love_30]
    @states[:_love_30] = [:_15_30, :_love_40]
    @states[:_love_40] = [:_15_30, :game_2]

    @states[:_15_15] = [ :_30_15, :_15_30]
    @states[:_30_15] = [:_40_15, :_30_30]
    @states[:_15_30] = [:_30_30, :_15_40]
    @states[:_40_15] = [:game_1, :_40_30]
    @states[:_15_40] = [:_30_40, :game_2]

    @states[:_30_30] = [:_40_30, :_30_40]
    @states[:_30_40] = [:deuce, :game_2]
    @states[:_40_30] = [:game_1, :deuce]

    @states[:deuce]  = [:advantage_1, :advantage_2]
    @states[:advantage_1] = [:game_1, :deuce]
    @states[:advantage_2] = [:deuce, :game_2]
    @states[:game_1] = [:game_1, :game_1]
    @states[:game_2] = [:game_2, :game_2]

    @current = :love_all
  end

  def left
    transition(0)
  end

  def right
    transition(1)
  end

  def transition(side)
    @current = @states[@current][side]
  end
end
