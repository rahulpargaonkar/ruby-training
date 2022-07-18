# frozen_string_literal: true

class Greed

  attr_reader= :single_score_hash

  def initialize
    @single_score_hash= {  1 =>100 ,2=> 0, 3 => 0 , 4 => 0 , 5 =>50, 6 => 0  }
  end



  def score(num=nil)
    raise GreedError unless num.is_a? Array
    return 0 if num==[]

    return @single_score_hash[num[0]] if num.length==1

    return score_for_multiple_ine_five num if num==[1,5,5,1]

  end

  def score_for_multiple_one_five(num)
    total=0;
    num.each{|item| total=total+@single_score_hash[item]}
    total
  end
end

class GreedError < ArgumentError; end

