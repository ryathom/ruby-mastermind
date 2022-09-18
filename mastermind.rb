# frozen_string_literal: true

require_relative 'player'

# Game logic
class Mastermind
  def initialize
    welcome_msg
    register_players
    @max_turns = 12
  end

  def main
    replay = true

    while replay
      initial_game_state
      play

      announce_winner
      puts 'Would you like to play again? (y/n)'
      replay = (gets.chomp == 'y')
      system 'clear'
    end
  end

  private

  def play
    until @game_over
      guess = @codebreaker.guess(@turn)
      @game_over = @codemaker.evaluate_guess(guess)
      @winner = @codebreaker if @game_over == true

      @turn += 1
      if @turn > @max_turns
        @game_over = true
        @winner = @codemaker
      end
    end
  end

  def initial_game_state
    @codemaker.make_code
    @turn = 1
    @game_over = false
    @winner = nil
  end

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

  def announce_winner
    puts nil
    if @winner.ishuman?
      puts 'Congratulations, you have bested the computer.'
    else
      puts 'Too bad, the computer has outsmarted you.'
      puts "The code was #{@codemaker.code}"
    end
  end
end

game = Mastermind.new
game.main
