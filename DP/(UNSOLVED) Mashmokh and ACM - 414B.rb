def solution1(n, k)
  memo = Array.new(k+1) { Array.new(n+1, 0) }
  memo[1] = Array.new(n+1, 1)
  memo[1][0] = 0

  for i in 2..k do
    for j in 1..n do
      cnt = 0
      for x in j..n do
        cnt += memo[i-1][x] if x%j == 0
      end
      memo[i][j] = cnt
    end
  end
  memo.last.reduce(:+) % 1000000007
end

def solution2(n, k)
  memo = Array.new(n+1, 1)
  memo[0] = 0

  for i in 2..k do
    for j in 1..n do
      cnt = 0
      for x in j..n do
        cnt += memo[x] if x%j == 0
      end
      memo[j] = cnt % 1000000007
    end
  end
  memo.reduce(:+) % 1000000007
end

def solution(ni, counter, max_length, n)
  return 1 if counter == max_length
  cnt = 0
  for next_n in ni..n do
    cnt += solution(next_n, counter+1, max_length, n) if next_n % ni == 0
  end
  cnt
end

def solution(n, k)
  posibilities = [0]

  for i in 1..n do
    cnt = 0
    for j in i..n do
      cnt += 1 if j % i == 0
    end
    posibilities << cnt
  end

  cnt = 0
  for i in 2..k do
    for j in 1..n do
      cnt += posibilities[j]
    end
  end
  posibilities
end

def solution
solution(1, 0, 2, 3)



Benchmark.bm do |x|
  x.report { solution1(1478, 194) }
  x.report { solution2(1478, 194) }
end

puts solution(*gets.split.map(&:to_i))
