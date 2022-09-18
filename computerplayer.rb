require './player'

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
