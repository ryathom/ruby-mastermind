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
    full = full_matches(guess)
    partial = partial_matches(guess) - full

    display_feedback(full, partial)

    full == 4
  end

  private

  def full_matches(guess)
    full = 0

    @code.each_with_index do |n, i|
      full += 1 if guess[i] == n
    end

    full
  end

  def partial_matches(guess)
    partial = 0

    (1..6).each do |x|
      code_cnt = @code.count(x)
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

# Child class for human-controlled player
class HumanPlayer < Player
  def ishuman?
    true
  end

  def make_guess(turn)
    puts nil
    puts "Turn ##{turn}: Type in four numbers (1-6) to guess the code."
    valid_code
  end

  def make_code
    puts nil
    puts 'Enter your 4 digit code using numbers from 1 to 6:'
    @code = valid_code
  end

  private

  def valid_code
    code = code_input

    until (code.length == 4) && (code.all? { |n| n.between?(1, 6) })
      puts 'Unrecognised input: Enter a sequence of four numbers from 1-6.'
      puts 'Don\'t use spaces as seperators.' if code.include?(' ')
      code = code_input
    end

    code
  end

  def code_input
    code = gets.chomp.split('')
    code.map!(&:to_i)
  end
end

# Child class for computer-controlled player
class ComputerPlayer < Player
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
    puts 'Beep boop, let me guess...' if turn == 1
    sleep 1

    guess = []
    4.times { guess << (rand 1..6) }

    puts "Turn ##{turn}: The computer guessed #{guess}"
    sleep 1
    guess
  end
end
