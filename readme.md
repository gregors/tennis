Test-drive some code to keep track of the score of a single tennis game and present it as String.

The score of a tennis game has two stages.

In the first, which we will call the Absolute Stage, the two players proceed through a sequence of absolute point names: "love," "fifteen," "thirty," and "forty." During this stage, the score will be either of the form "Alice forty, Bob fifteen" if the players have different scores, or of the form "Love all" if the scores are the same.

When a player has forty and scores again, what happens depends on the other player's score. If the other player has forty as well, the game moves on to the Relative Stage. If the other player does not have forty yet, the game is over.

In the second stage, the Relative Stage, the representation of the score depends on how many points one player has relative to the other. If Alice and Bob have the same score, the representation is "Deuce." If Bob has one more point Alice, the representation is "Advantage Bob." If Alice scores two more points than Bob, the score is "Game Alice," and the game is over.

Note that the Absolute Stage cannot possibly last longer than a total of eight points, but the Relative Stage can theoretically go on forever, as long as no one ever has two points more than his opponent.

Write some code that can take a series of scores by one player or the other and produce the proper representation of the game's score at each step.

Prohibit further scoring after the game has ended.


# Running with Docker
  ## build image
   `docker build -t tennis .`

  ## run test
   `docker run -t --rm tennis`

# Running locally
  ` bundle install`

  `bundle exec rspec --format doc` 
