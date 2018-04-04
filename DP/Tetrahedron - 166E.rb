def solution(n)
  h = { :A => Array.new(n+1, 0), :B => Array.new(n+1, 0), :C => Array.new(n+1, 0), :D => Array.new(n+1, 0) }
  h[:D][0] = 1
  positions = [:A, :B, :C, :D]
  for i in 1..n do
      positions.each do |position|
        cnt = 0
        (positions - [position]).each do |jump_to|
          cnt += h[jump_to][i-1]
        end
        h[position][i] = cnt
      end
  end
  h[:D][n] % 1000000007
end

n = gets.to_i
puts solution(n)
