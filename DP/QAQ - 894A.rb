def solution(string)
  q, a, qa, count = 0, 0, 0, 0
  for i in 0...string.size do
    if string[i] == "Q"
      q += 1
      count += qa
    end
    if string[i] == "A"
      a += 1
      qa += q
    end
  end
  count
end

def solution(string)
  left_q = string.each_char.inject([0]) { |memo, chr| memo + [memo.last + (chr == "Q" ? 1 : 0)] }.tap { |o| o.shift }
  right_q = string.reverse.each_char.inject([0]) { |memo, chr| memo + [memo.last + (chr == "Q" ? 1 : 0)] }.tap { |o| o.shift }.reverse

  count = 0
  for i in 1...string.size-1 do
    if string[i] == "A"
      count += left_q[i]*right_q[i]
    end
  end
  count
end

puts solution(gets.strip)

solution("QAQAQYSYIOIWIN")
solution("QAQQQZZYNOIWIN")
