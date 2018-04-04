def solution(arr, m, k)
  @max_block_sum = Array.new(k+1) { Array.new(arr.size, false) }

  @block_value_at = []
  arr.each_cons(m) do |slice|
    @block_value_at << slice.reduce(:+)
  end

  def solve(arr, starts_at, m, k)
    return 0 if k == 0
    if @max_block_sum[k][starts_at]
      return @max_block_sum[k][starts_at]
    end

    max = 0
    for i in starts_at..arr.size-k*m do
      max = [max, @block_value_at[i] + solve(arr, i+m, m, k-1)].max if i < @block_value_at.size
    end
    @max_block_sum[k][starts_at] = max
  end
  solve(arr, 0, m, k)
end


def solution(arr, m, k)
  @max_block_sum = Array.new(k+1) { Array.new(arr.size, false) }

  @block_value_at = []
  @block_value_at[0] = arr[0...m].reduce(:+)

  for i in m...arr.size do
    @block_value_at << @block_value_at.last + arr[i] - arr[i-m]
  end

  arr.each_cons(m) do |slice|
    @block_value_at << slice.reduce(:+)
  end

  def solve(arr, starts_at, m, k)
    return 0 if k == 0
    if @max_block_sum[k][starts_at]
      return @max_block_sum[k][starts_at]
    end

    max = 0
    for i in starts_at..arr.size-k*m do
      max = [max, @block_value_at[i] + solve(arr, i+m, m, k-1)].max
    end
    @max_block_sum[k][starts_at] = max
  end
  solve(arr, 0, m, k)
end

def solution(arr, m, k)
  max_values = Array.new(k) { Array.new(arr.size, 0) }
  block_values = Array.new(arr.size, 0)

  for i in m-1...arr.size do
    block_values[i] = arr[i-m+1..i].reduce(:+)
  end

  for i in 0...k do
    max = 0
    for j in m-1...arr.size-(k-i-1)*m do
      max = [max, block_values[j] + (j-m >= 0 && i-1 >= 0 ? max_values[i-1][j-m] : 0)].max
      max_values[i][j] = max
    end
  end
  max_values[k-1].last
end
_, m, k = gets.split.map(&:to_i)
puts solution(gets.split.map(&:to_i), m, k)

solution([1, 2, 3, 4, 5], 2, 1)
solution([2, 10, 7, 18, 5, 33, 0], 1, 3)

max_values = Array.new(3) { Array.new(5+1, 0) }

#
# @max_block_sum[2][2]
a=1
Array.new(10, a)
