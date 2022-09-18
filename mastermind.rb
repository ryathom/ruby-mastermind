# frozen_string_literal: true

require_relative 'player'

class Mastermind
  def initialize
    welcome_msg
  end

  private

  def welcome_msg
    puts '-----------------------------------'
    puts '------ Welcome to Mastermind ------'
    puts '-----------------------------------'
    puts nil
  end
end

game = Mastermind.new
