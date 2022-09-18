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
end

# Child class for computer-controlled player
class ComputerPlayer < Player
  def ishuman?
    false
  end

  def set_code
    puts 'Beep boop, setting a code...'

    code = []
    4.times { code << (rand 1..6) }

    puts 'The computer has chosen a code - now try to break it.'
    code
  end
end
