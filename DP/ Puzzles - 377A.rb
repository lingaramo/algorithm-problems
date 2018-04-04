def solution(n, pieces)
  pieces.sort!
  min_diff = 2 << 2048

  for i in n-1...pieces.size do
    min_diff = [min_diff, pieces[i] - pieces[i - n + 1]].min
  end

  min_diff
end

n, m = gets.strip.split().map { |i| i.to_i }
pieces = gets.strip.split().map { |i| i.to_i }

solution(n, pieces)
