# frozen_string_literal: true

class Dice
  attr_reader :values

  def roll(number = 1)
    @values = []
    while number >= 1
      @values << rand(1..6)
      number -= 1
    end
    @values
  end
end
