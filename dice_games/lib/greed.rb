# frozen_string_literal: true

class Greed

  def score
    raise GreedError
  end
end

class GreedError < ArgumentError; end
