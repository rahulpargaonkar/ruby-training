# frozen_string_literal: true

class NumberValidator

  attr_reader :number

  def number_groups
    return number.even? ? :even : :odd
  end

  def validate(number)
    # WRITE THIS CODE
    @number = number
    value = []
    hash = {3 => 'three', 5 => 'five', 7=> 'seven', 9=> 'nine'}

    raise InvalidNumberError unless number.is_a?(Integer)
    value << number_groups << [3, 5, 7, 9].each do |item|
      value << "divisible_by_#{hash[item]}".to_sym if number.modulo(item).zero?
    end

  end
end

# Do not edit this code!
class InvalidNumberError < ArgumentError; end
