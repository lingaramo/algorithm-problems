def is_posible?(s, k)
    n = s.size
    return true if n == k
    chars = [0]*255
    s[0...k].split("").each{ |c| chars[c.ord] += 1 }
    i = 1

    while i+k <= n do
        chars[s[i+k-1].ord] += 1 if chars[s[i+k-1].ord] and chars[s[i+k-1].ord] > 0
        chars[s[i-1].ord] -= 1 if chars[s[i-1].ord]
        i += 1
    end

    chars.each do |v|
       return true if v > 0
    end
    false
end


def solution(s)
  beg = 1
  last = s.size - 1
  min_k = s.size

  while (beg <= last) do
     mid = (last + beg)/2

     if is_posible?(s, mid)
         min_k = mid
         last = mid - 1
     else
         beg = mid + 1
     end
  end
  min_k
end

puts solution(gets.strip())
