def solution(fence, take)
  cost = Array.new(fence.size, Float::INFINITY)
  cost[0] = fence[0...take].reduce(:+)

  for i in 1...fence.size-take+1 do
    cost[i] = cost[i-1] - fence[i-1] + fence[i + take - 1]
  end

  remove = 0
  min_cost = Float::INFINITY
  cost.each_with_index do |c, index|
    if min_cost > c
      min_cost = c
      remove = index
    end
  end
  remove + 1
end


def solution(fence, take)
  prefix_sum = fence.inject([0]) { |v, i| v << v.last + i }

  min_cost = Float::INFINITY
  for i in 0...prefix_sum.size-take do
    if min_cost > prefix_sum[i+take] - prefix_sum[i]
      min_cost = prefix_sum[i+take] - prefix_sum[i]
      index = i + 1
    end
  end
  index
end

tables, take = gets.split.map(&:to_i)
fence = gets.split.map(&:to_i)

puts solution(fence, take)

fence = [1, 2, 6, 1, 1, 7, 1]
take = 3
