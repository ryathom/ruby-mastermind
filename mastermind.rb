# frozen_string_literal: true

require_relative 'player'

class Mastermind
  def initialize
    welcome_msg
    register_players
  end

  private

  def welcome_msg
    puts '-----------------------------------'
    puts '------ Welcome to Mastermind ------'
    puts '-----------------------------------'
    puts nil
  end

  def register_players
    @player1 = HumanPlayer.new('codebreaker')
    @player2 = ComputerPlayer.new('codemaker')
  end
end

game = Mastermind.new
