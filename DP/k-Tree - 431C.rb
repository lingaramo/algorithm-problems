def solution(n, k, d)
  @memo = Array.new(2) { Array.new(n+1, false) }
  def solve(n, k, d, flag)
    return @memo[(flag ? 1 : 0)][n] if @memo[(flag ? 1 : 0)][n]
    return 1 if n == 0 && flag
    return 0 if n == 0 && !flag
    cnt = 0
    for i in 1..k do
      cnt += solve(n-i, k, d, flag || (i >= d)) if n-i >= 0
    end
    @memo[(flag ? 1 : 0)][n] = cnt
  end
  solve(n, k, d, false)
  @memo[0][n] % 1000000007
end

puts solution(*gets.split.map(&:to_i))
