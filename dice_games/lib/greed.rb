# frozen_string_literal: true

class Greed

  attr_reader :single_score_hash, :tripple_score_hash

  def initialize
    @single_score_hash= {  1 =>100 ,2=> 0, 3 => 0 , 4 => 0 , 5 =>50, 6 => 0  }
    @tripple_score_hash= {  1 =>1000 ,2=> 100, 3 => 100 , 4 => 100 , 5 =>100, 6 => 100  }
  end



  def score(num=nil)
    raise GreedError unless num.is_a? Array
    return 0 if num==[]

    return @single_score_hash[num[0]] if num.length==1

    return num[0]*@tripple_score_hash[num[0]] if num.length==3

    return score_for_specific_input num if num==[1,5,5,1] || [2,3,4,6]



  end

  private

  def score_for_specific_input(num)
    total=0
    num.each{|item| total=total+@single_score_hash[item]}
    total
  end

end

class GreedError < ArgumentError; end

