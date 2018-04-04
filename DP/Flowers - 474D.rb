def solution(arr, k)
  n = 0
  arr.each do |a|
    n = [n, a[1]].max
  end

  options_numbers = Array.new(n+1, 0)
  options_numbers[0] = 1
  options_numbers[1] = ( k == 1 ? 2 : 1)
  for i in 2..n do
    options_numbers[i] = options_numbers[i-1] + ((i-k) >= 0 ? options_numbers[i-k] : 0 )
  end

  prefix = Array.new(n+1, 0)
  for i in 1..n do
    prefix[i] = (options_numbers[i] + prefix[i-1])
  end

  arr.each do |values|
    puts (prefix[values[1]] - prefix[values[0]-1]) % 1000000007
  end
end

t, k = gets.split.map(&:to_i)
arr = []
t.times do
  arr << gets.split.map(&:to_i)
end
solution(arr, k)

# solution([[58867, 93494]], 48096)

k = 48096
arr = [[75634,80941],
[27808,89615],
[58867,93494],
[95515,99613],
[68307,69216],
[87597,99003],
[64525,89488],
[56469,61318],
[50786,67032],
[95957,95991],
[27221,91249],
[90963,97482],
[57775,78829],
[93561,95491],
[18075,71046],
[33750,47319],
[36715,62836],
[50235,75664],
[20497,72621],
[33727,90394],
[82535,98095],
[22972,52193],
[62856,84905],
[62895,77814],
[84660,94050],
[69168,76205],
[75335,83969],
[18116,23569],
[220,95850],
[83035,91427],
[37864,42474],
[73158,85885],
[47805,90652],
[45561,80907],
[10066,74979],
[27245,67580],
[88609,93808]]
