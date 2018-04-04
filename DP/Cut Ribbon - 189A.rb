def solution(n, a, b, c)
  max_cuts = Array.new([n,a,b,c].max+1, -Float::INFINITY)
  max_cuts[a] = 1
  max_cuts[b] = 1
  max_cuts[c] = 1

  for i in 1...max_cuts.size do
    max_cuts[i] = [
      max_cuts[i],
      1 + max_cuts[(i-a >= 0 ? i-a : 0)],
      1 + max_cuts[(i-b >= 0 ? i-b : 0)],
      1 + max_cuts[(i-c >= 0 ? i-c : 0)]
    ].max
    return max_cuts[i] if n == i
  end

  max_cuts[n]
end


n, a, b, c = gets.split.map(&:to_i)
puts solution(n, a, b, c)
