# frozen_string_literal: true

class NumberValidator
  attr_reader :number, :value, :number_hash

  def initialize
    @number_hash = { 3 => 'three', 5 => 'five', 7 => 'seven', 9 => 'nine' }
    @value = []
  end

  def validate(number)
    @number = number
    raise InvalidNumberError unless number.is_a?(Integer)

    value << number_groups
    value << divisible_by_numbers
  end

  private

  def number_groups
    number.even? ? :even : :odd
  end

  def divisible_by_numbers
    number_hash.each_key do |item|
      value << "divisible_by_#{number_hash[item]}".to_sym if number.modulo(item).zero?
    end
  end
end

# Do not edit this code!
class InvalidNumberError < ArgumentError; end
