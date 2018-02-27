# You are given an array A consisting of N integers.
#
# For each number A[i] such that 0 ≤ i < N, we want to count the number of elements of the array that are not the divisors of A[i]. We say that these elements are non-divisors.
#
# For example, consider integer N = 5 and array A such that:
#
#     A[0] = 3
#     A[1] = 1
#     A[2] = 2
#     A[3] = 3
#     A[4] = 6
# For the following elements:
#
# A[0] = 3, the non-divisors are: 2, 6,
# A[1] = 1, the non-divisors are: 3, 2, 3, 6,
# A[2] = 2, the non-divisors are: 3, 3, 6,
# A[3] = 3, the non-divisors are: 2, 6,
# A[4] = 6, there aren't any non-divisors.
# Write a function:
#
# def solution(a)
#
# that, given an array A consisting of N integers, returns a sequence of integers representing the amount of non-divisors.
#
# The sequence should be returned as:
#
# a structure Results (in C), or
# a vector of integers (in C++), or
# a record Results (in Pascal), or
# an array of integers (in any other programming language).
# For example, given:
#
#     A[0] = 3
#     A[1] = 1
#     A[2] = 2
#     A[3] = 3
#     A[4] = 6
# the function should return [2, 4, 3, 2, 0], as explained above.
#
# Assume that:
#
# N is an integer within the range [1..50,000];
# each element of array A is an integer within the range [1..2 * N].
# Complexity:
#
# expected worst-case time complexity is O(N*log(N));
# expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).


# 100%, 25%, 66% Correctness, perfomance, Total score
def solution(a)
  n = a.size
  divisors = a.sort
  non_divisors = [nil]*(divisors.last+1)

  for i in 0...n do
    element = divisors[i]
    next if non_divisors[element] != nil

    j=0
    non_divisors_count = 0
    while j < n do
      if element < divisors[j]/2 #Min -factor!!!
        if divisors[j] == element
          nil
        else
          if divisors[j] > element
            non_divisors_count = non_divisors_count + n - j
            break
          else
            non_divisors_count += 1
          end
        end
      else
        if element%divisors[j] != 0
          non_divisors_count += 1
        end
      end
      j+=1
    end
    non_divisors[element] = non_divisors_count
  end

  result = []
  for i in 0...n do
    result << non_divisors[a[i]]
  end

  result
end
