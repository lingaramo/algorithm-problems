# We draw N discs on a plane. The discs are numbered from 0 to N − 1. A zero-indexed array A of N non-negative integers, specifying the radiuses of the discs, is given. The J-th disc is drawn with its center at (J, 0) and radius A[J].
#
# We say that the J-th disc and K-th disc intersect if J ≠ K and the J-th and K-th discs have at least one common point (assuming that the discs contain their borders).
#
# The figure below shows discs drawn for N = 6 and A as follows:
#
#   A[0] = 1
#   A[1] = 5
#   A[2] = 2
#   A[3] = 1
#   A[4] = 4
#   A[5] = 0
#
#
# There are eleven (unordered) pairs of discs that intersect, namely:
#
# discs 1 and 4 intersect, and both intersect with all the other discs;
# disc 2 also intersects with discs 0 and 3.
# Write a function:
#
# class Solution { public int solution(int[] A); }
#
# that, given an array A describing N discs as explained above, returns the number of (unordered) pairs of intersecting discs. The function should return −1 if the number of intersecting pairs exceeds 10,000,000.
#
# Given array A shown above, the function should return 11, as explained above.
#
# Assume that:
#
# N is an integer within the range [0..100,000];
# each element of array A is an integer within the range [0..2,147,483,647].
# Complexity:
#
# expected worst-case time complexity is O(N*log(N));
# expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
#
# input_pos = []
# input_r = []
# arr = []
# for i in len(input_pos)
#   arr.push(make_pair(input_pos[i]-input_r[i], 1))
#   arr.push(make_pair(input_pos[i]+input_r[i], -1))
#
# sort(arr, lambda x, y: x.first < y.first || (x.first == y.first && x.second > y.second))
#
# abre = 0
# sum = 0
# for i in len(arr)
#   if arr[i].second == 1
#     sum += abre
#   abre += arr[i].second


# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
  left, right = [], []
  for i in 0...a.length
    left << i-a[i]
    right << i + a[i]
  end

  left.sort!
  right.sort!

  counter = 0
  sum = 0
  left_index, right_index = 0, 0
  left_count, right_count = 0, 0

  while right_index < right.length
    if left[left_index] <= right[right_index] && left_index < left.length - 1
      left_index += 1
      left_count += 1
    elsif left[left_index] > right[right_index]
      right_index += 1
      right_count += 1
      sum = sum + left_count - right_count
    else
      sum = sum + left_count - right_count
      right_count += 1
      right_index += 1
    end
    return -1 if sum > 10_000_000
  end

  sum
end
