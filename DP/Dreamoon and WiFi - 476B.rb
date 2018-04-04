def solution(s1, s2)
  x = s1.count("+") - s1.count("-")
  @memo = Array.new(11) { Array.new(20) }

  def solve(s2, pos, i, x)
    return @memo[i][pos+10] if @memo[i][pos+10]

    if s2.size == i
      return 0 if pos != x
      return 1
    end

    if s2[i] == "?"
      @memo[i][pos+10] = solve(s2, pos+1, i+1, x) + solve(s2, pos-1, i+1, x)
      return @memo[i][pos+10]
    end

    @memo[i][pos+10] = solve(s2, pos+(s2[i] == "+" ? 1 : -1), i+1, x)
  end

  if s2.count("?") == 0
    return Float(solve(s2, 0, 0, x))
  else
    return solve(s2, 0, 0, x) / Float(2**s2.count("?"))
  end
end

s1 = gets.strip
s2 = gets.strip
puts solution(s1, s2)

solution("++++++++++", "++++++++++")
solution("++++++++++", "+++??++?++")




solution("+-+-", "+-??")

solution("+++", "??-")

solution("++-+-", "+-+-+")
