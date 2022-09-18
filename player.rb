# frozen_string_literal: true

# Parent class for game player
class Player
  attr_reader :code

  def initialize(role)
    @role = role
  end

  def iscodemaker?
    true if @role == 'codemaker'
  end

  def iscodebreaker?
    true if @role == 'codebreaker'
  end

  def evaluate_guess(guess)
    full = full_matches(@code, guess)
    partial = partial_matches(@code, guess) - full

    display_feedback(full, partial)
    @opponent.clue = [full, partial] if ishuman? && iscodemaker?
    full == 4
  end

  private

  def full_matches(code, guess)
    full = 0

    code.each_with_index do |n, i|
      full += 1 if guess[i] == n
    end

    full
  end

  def partial_matches(code, guess)
    partial = 0

    (1..6).each do |x|
      code_cnt = code.count(x)
      guess_cnt = guess.count(x)
      partial += [code_cnt, guess_cnt].min
    end

    partial
  end

  def display_feedback(full, partial)
    puts "Matches: #{full}"
    puts "Partial matches: #{partial}"
  end
end
