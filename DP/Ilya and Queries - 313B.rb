def solution(s, list)
  acc = [0]
  prev = ""
  s.each_char do |char|
    acc << acc.last + (prev == char ? 1 : 0)
    prev = char
  end

  list.each do |item|
    puts acc[item[1]] - acc[item[0]]
  end
end

s = gets.strip
n = gets.strip.to_i

list = []

n.times do
  list << gets.split.map(&:to_i)
end

solution(s, list)
