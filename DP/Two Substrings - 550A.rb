def solution(string)
  return "NO" if string.index("AB").nil? || string.index("BA").nil?
  return "YES" if (string.rindex("AB") - string.index("BA")).abs != 1
  return "YES" if (string.rindex("BA") - string.index("AB")).abs != 1
  "NO"
end
puts solution(gets.strip)


solution("ABA")
solution("BACFAB")
solution("AXBYBXA")
