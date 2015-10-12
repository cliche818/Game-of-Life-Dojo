class Game

  def initialize(life)
    @life = life
  end

  def play(number_of_turns)
    number_of_turns.times do
      @life.next_phase
      puts @life.display
    end
  end
end