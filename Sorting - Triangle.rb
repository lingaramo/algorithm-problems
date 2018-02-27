# A zero-indexed array A consisting of N integers is given. A triplet (P, Q, R) is triangular if 0 ≤ P < Q < R < N and:
#
# A[P] + A[Q] > A[R],
# A[Q] + A[R] > A[P],
# A[R] + A[P] > A[Q].
# For example, consider array A such that:
#
#   A[0] = 10    A[1] = 2    A[2] = 5
#   A[3] = 1     A[4] = 8    A[5] = 20
# Triplet (0, 2, 4) is triangular.
#
# Write a function:
#
# def solution(a)
#
# that, given a zero-indexed array A consisting of N integers, returns 1 if there exists a triangular triplet for this array and returns 0 otherwise.
#
# For example, given array A such that:
#
#   A[0] = 10    A[1] = 2    A[2] = 5
#   A[3] = 1     A[4] = 8    A[5] = 20
# the function should return 1, as explained above. Given array A such that:
#
#   A[0] = 10    A[1] = 50    A[2] = 5
#   A[3] = 1
# the function should return 0.
#
# Assume that:
#
# N is an integer within the range [0..100,000];
# each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
# Complexity:
#
# expected worst-case time complexity is O(N*log(N));
# expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).

def solution(a)
  return 0 if a.length < 3
  a.sort!
  unique = [a[0]]

  for i in 0...a.length
    if unique[-1] == a[i] && unique[-2] != a[i]
      unique << a[i]
    elsif unique[-1] != a[i]
      unique << a[i]
    end
  end

  return 0 if unique.length < 3

  for i in 0...unique.length-2
    if unique[i] + unique[i+1] > unique[i+2] && unique[i+1] + unique[i+2] > unique[i] && unique[i+2] + unique[i] > unique[i+1]
      return 1
    end
  end

  0
end
