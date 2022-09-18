# frozen_string_literal: true

require_relative 'player'

# Game logic
class Mastermind
  def initialize
    welcome_msg
    register_players
  end

  def play
    @codemaker.make_code
    turn = 1

    until turn > 12
      guess = @codebreaker.guess(turn)
      @codemaker.evaluate_guess(guess)
      turn += 1
    end
  end

  private

  def welcome_msg
    puts '-----------------------------------'
    puts '------ Welcome to Mastermind ------'
    puts '-----------------------------------'
    puts nil
  end

  def register_players
    @codebreaker  = HumanPlayer.new('codebreaker')
    @codemaker    = ComputerPlayer.new('codemaker')
  end
end

game = Mastermind.new
game.play
