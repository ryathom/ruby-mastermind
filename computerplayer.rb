# frozen_string_literal: true

require './player'

# Child class for computer-controlled player
class ComputerPlayer < Player
  attr_accessor :clue

  def initialize(role)
    super
    @possible = [1, 2, 3, 4, 5, 6].repeated_permutation(4).to_a if iscodebreaker?
  end

  def ishuman?
    false
  end

  def make_code
    puts 'Beep boop, setting a code...'

    @code = []
    4.times { @code << (rand 1..6) }

    puts 'The computer has chosen a code - now try to break it.'
    @code
  end

  def make_guess(turn)
    if turn == 1
      puts 'Beep boop, let me guess...'
      sleep 1
      guess = [1, 1, 2, 2]
    else
      guess = guess_algorithm(@clue)
    end

    puts "Turn ##{turn}: The computer guessed #{guess}"
    sleep 1
    @last_guess = guess
    guess
  end

  private

  def guess_algorithm(last_clue)
    # Test last guess against each possible answer and remove any that don't produce the same clue
    test_guess(@last_guess, last_clue)

    @possible.sample
  end

  def test_guess(guess, clue)
    @possible.select! do |ans|
      full = full_matches(ans, guess)
      part = partial_matches(ans, guess) - full

      # Return true if this is a possible answer
      clue == [full, part]
    end

    p @possible.length
  end
end
