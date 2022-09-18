# frozen_string_literal: true

require_relative 'player'

# Game logic
class Mastermind
  def initialize
    welcome_msg
    register_players
  end

  def play
    code = set_code
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

  def set_code
    @codemaker.set_code
  end
end

game = Mastermind.new
game.play
