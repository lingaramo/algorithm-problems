# Write a function:
#
# def solution(a, b, k)
# that, given three integers A, B and K, returns the number of integers within the range [A..B] that are divisible by K, i.e.:
#
# { i : A ≤ i ≤ B, i mod K = 0 }
# For example, for A = 6, B = 11 and K = 2, your function should return 3, because there are three numbers divisible by 2 within the range [6..11], namely 6, 8 and 10.
#
# Assume that:
#
# A and B are integers within the range [0..2,000,000,000];
# K is an integer within the range [1..2,000,000,000];
# A ≤ B.
# Complexity:
#
# expected worst-case time complexity is O(1);
# expected worst-case space complexity is O(1).

def solution(a, b, k)
  a_k = Integer(a/(1.0*k))
  b_k = Integer(b/(1.0*k))
  return b_k - a_k + 1 if a % k ==0
  b_k - a_k
end
