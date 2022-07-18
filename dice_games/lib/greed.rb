# frozen_string_literal: true

class Greed

  def score(num=nil)
    raise GreedError unless num.is_a? Array
    return 0 if num==[]
  end
end

class GreedError < ArgumentError; end

