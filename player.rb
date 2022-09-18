# frozen_string_literal: true

# Parent class for game player
class Player
  def initialize(role)
    @role = role
  end

  def iscodemaker?
    true if @role == 'codemaker'
  end

  def iscodebreaker?
    true if @role == 'codebreaker'
  end
end

# Child class for human-controlled player
class HumanPlayer < Player
  def ishuman?
    true
  end

  def guess(turn)
    puts nil
    puts "Turn ##{turn}: Type in four numbers (1-6) to guess the code."
    guess = valid_guess
  end

  private

  def valid_guess
    guess = guess_input

    until (guess.length == 4) && (guess.all? { |n| n.between?(1, 6) })
      puts 'Guess must be a sequence of four numbers from 1-6.'
      if ' ' in guess then
        puts 'Don\'t use spaces as seperators.'
      end
      guess = guess_input
    end
  end

  def guess_input
    guess = gets.chomp.split('')
    guess.map!(&:to_i)
  end
end

# Child class for computer-controlled player
class ComputerPlayer < Player
  def ishuman?
    false
  end

  def make_code
    puts 'Beep boop, setting a code...'

    code = []
    4.times { code << (rand 1..6) }

    puts 'The computer has chosen a code - now try to break it.'
    code
  end
end
