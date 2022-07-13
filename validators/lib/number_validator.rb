# frozen_string_literal: true

class NumberValidator

  attr_reader :number

  def number_groups
    return number.even? ? :even : :odd
  end

  def divisible_by_three
    return __method__ if number.modulo(3).zero?
  end

  def divisible_by_five
    return __method__ if number.modulo(5).zero?
  end

  def divisible_by_seven
    return __method__ if number.modulo(7).zero?
  end

  def divisible_by_nine
    return __method__ if number.modulo(9).zero?
  end

  def validate(number)
    # WRITE THIS CODE
    @number=number
    raise InvalidNumberError unless number.is_a?(Integer)
    [] << number_groups  << divisible_by_three << divisible_by_five <<
      divisible_by_seven << divisible_by_nine

  end
end

# Do not edit this code!
class InvalidNumberError < ArgumentError; end
