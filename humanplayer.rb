require './player'

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
