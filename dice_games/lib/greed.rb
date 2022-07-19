# frozen_string_literal: true

class Greed
  attr_reader :single_score_hash, :triple_score_hash

  def initialize
    @single_score_hash = { 1 => 100, 2 => 0, 3 => 0, 4 => 0, 5 => 50, 6 => 0 }
    @triple_score_hash = {  1 => 1000, 2 => 100, 3 => 100, 4 => 100, 5 => 100, 6 => 100 }
  end

  def score(num = nil)
    raise GreedError unless num.is_a? Array

    return 0 if num == []

    individual_score(num)
  end

  private

  def individual_score(num)
    num_hash = num.tally
    total = 0
    num_hash.map do |item, occurrence|
      total = calculate_score(item, occurrence, total)
    end
    total
  end

  def calculate_score(item, occurrence, total)
    while occurrence.positive?
      if occurrence >= 3
        total += (item * @triple_score_hash[item])
        occurrence -= 3
      else
        total += @single_score_hash[item]
        occurrence -= 1
      end
    end
    total
  end
end

class GreedError < ArgumentError; end
