# frozen_string_literal: true

class LetterValidator

  attr_reader :letter

  def letter_class
    return letter.match(/[aeiou]/) ? :vowel : :consonant
  end

  def letter_half
    return letter.match(/[a-m]/) ? :first_half : :second_half
  end

  def most_comman_letter
    return :common_letter if letter.match(/[etaio]/)
  end

  def validate(letter)
    # WRITE THIS CODE
    @letter=letter
    raise InvalidLetterError if letter.length > 1
    [] << letter_class << letter_half << most_comman_letter
  end
end

# Do not edit this code!
class InvalidLetterError < ArgumentError; end
