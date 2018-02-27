# http://www.spoj.com/problems/SUMFOUR/
# The SUM problem can be formulated as follows: given four lists A, B, C, D of integer values, compute how many quadruplet (a, b, c, d ) belongs to A x B x C x D are such that a + b + c + d = 0 . In the following, we assume that all lists have the same size n
#
# Input
#
# The first line of the input file contains the size of the lists n (this value can be as large as 4000). We then have n lines containing four integer values (with absolute value as large as 228 ) that belong respectively to A, B, C and D .
#
# (Edited: n <= 2500)
#
# Output
#
# Output should be printed on a single line.
#
# Example
#
# Input:
# 6
# -45 22 42 -16
# -41 -27 56 30
# -36 53 -37 77
# -36 30 -75 -46
# 26 -38 -10 62
# -32 -54 -6 45
# Output:
# 5

n = gets.to_i
a, b, c, d = [], [], [], []
for i in 0...n do
  elements = gets.split().map { |i| i.to_i }
  a << elements[0]
  b << elements[1]
  c << elements[2]
  d << elements[3]
end

def solution(a,b,n)
  aabb, ccdd = [], []

  for i in 0...n do
    for j in 0...n do
      aabb << a[i]+b[j]
      ccdd << c[i]+d[j]
    end
  end

  aabb.sort!
  ccdd.sort!

  multiplicity = {}
  count = 0
  for i in 0...n**2 do
    if multiplicity[-1*ccdd[i]] == nil
      multiplicity[-1*ccdd[i]] = 1
    else
      multiplicity[-1*ccdd[i]] += 1
    end
  end

  for i in 0...n**2 do
    first, last = 0, n**2
    while (first <= last) do
      mid = (last + first)/2
      if aabb[i] + ccdd[mid] == 0
        count += multiplicity[ccdd[mid]]
        break
      end

      if -1*aabb[i] < ccdd[mid]
        last = mid - 1
      else
        first = mid + 1
      end
    end
  end
  count
end

puts solution(a,b,n)
nil























n = gets.to_i
a, b, c, d = [], [], [], []
for i in 0...n do
  elements = gets.split().map { |i| i.to_i }
  a << elements[0]
  b << elements[1]
  c << elements[2]
  d << elements[3]
end

def solution(a,b,n)
  aabb, ccdd = [], []

  for i in 0...n do
    for j in 0...n do
      aabb << a[i]+b[j]
      ccdd << c[i]+d[j]
    end
  end

  aabb.sort!
  ccdd.sort!

  multiplicity = {}
  count = 0
  for i in 0...n**2 do
    if multiplicity[-1*ccdd[i]] == nil
      multiplicity[-1*ccdd[i]] = 1
    else
      multiplicity[-1*ccdd[i]] += 1
    end
  end

  for i in 0...n**2 do
    count += multiplicity[aabb[i]] if multiplicity[aabb[i]]
  end

  count
end

puts solution(a, b, n)
