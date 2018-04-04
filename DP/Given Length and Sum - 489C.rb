def solution(m, s)
  digits = [9]*(s/9) + ( s%9 != 0 ? [s%9] : [] )
  return "-1 -1" if digits.size > m || (digits.size == 0 && m != 1)

  max = digits.join() + "0"*(m-digits.size)
  min = digits.reverse[0].to_s + "0"*(m-digits.size) + (digits.reverse[1] ? digits.reverse[1...digits.size].join() : "")

  "#{min} #{max}"
end

puts solution(*gets.strip.split.map(&:to_i))
