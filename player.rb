# frozen_string_literal: true

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

class HumanPlayer < Player
  def ishuman?
    true
  end
end

class ComputerPlayer < Player
  def ishuman?
    false
  end
end
