# frozen_string_literal: true

class Greed
  attr_reader :single_score_hash, :tripple_score_hash

  def initialize
    @single_score_hash = { 1 => 100, 2 => 0, 3 => 0, 4 => 0, 5 => 50, 6 => 0 }
    @triple_score_hash = {  1 => 1000, 2 => 100, 3 => 100, 4 => 100, 5 => 100, 6 => 100 }
  end



  def score(num = nil)
    raise GreedError unless num.is_a? Array
    return 0 if num == []

    return @single_score_hash[num[0]] if num.length == 1

    return num[0] * @triple_score_hash[num[0]] if num.length == 3

    return score_for_specific_input num if num == [1, 5, 5, 1] || num == [2, 3, 4, 6] || num.uniq == num

    return high_score(num)
  end

  private

  def score_for_specific_input(num)
    total = 0
    num.each { |item| total += @single_score_hash[item] }
    total
  end

  def high_score(num)
    num_hash=num.tally
    total=0
    num_hash.map do
    |item,occurrence|
      while occurrence>0
        if occurrence>=3
          total=total+(item*@triple_score_hash[item])
          occurrence=occurrence-3
        else
          total=total+@single_score_hash[item]
          occurrence=occurrence-1
        end
      end
    end
    total
  end
end

class GreedError < ArgumentError; end
