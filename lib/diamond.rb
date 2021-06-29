class Diamond

  attr_reader :letters
  attr_accessor :diamond

  def initialize(input)
    @letters = ("A"..input).to_a
    @diamond = ""
  end

  def build
    draw_opening
    draw_closing

    diamond
  end

  private

  def draw_opening
    letters.each do |letter| 
      diamond << letter_line(letter)
    end
  end

  def draw_closing
    letters.reverse[1..-1].each do |letter| 
      diamond << letter_line(letter)
    end
  end

  def letter_line(letter)
    line = ""

    draw_until_letter(letter, line)
    draw_after_letter(letter, line)    
    
    line << "\n"
  end

  def draw_until_letter(letter, line)
    letters.reverse.each do |position|
      line << character_value(position, letter)
    end
  end

  def draw_after_letter(letter, line)
    letters[1..-1].each do |position|
      line << character_value(position, letter)
    end
  end 

  def character_value(position, letter)
    position == letter ? letter : "_"
  end
end
