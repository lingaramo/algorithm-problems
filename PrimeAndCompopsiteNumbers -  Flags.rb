# A non-empty zero-indexed array A consisting of N integers is given.
#
# A peak is an array element which is larger than its neighbours. More precisely, it is an index P such that 0 < P < N − 1 and A[P − 1] < A[P] > A[P + 1].
#
# For example, the following array A:
#
#     A[0] = 1
#     A[1] = 5
#     A[2] = 3
#     A[3] = 4
#     A[4] = 3
#     A[5] = 4
#     A[6] = 1
#     A[7] = 2
#     A[8] = 3
#     A[9] = 4
#     A[10] = 6
#     A[11] = 2
# has exactly four peaks: elements 1, 3, 5 and 10.
#
# You are going on a trip to a range of mountains whose relative heights are represented by array A, as shown in a figure below. You have to choose how many flags you should take with you. The goal is to set the maximum number of flags on the peaks, according to certain rules.
#
#
#
# Flags can only be set on peaks. What's more, if you take K flags, then the distance between any two flags should be greater than or equal to K. The distance between indices P and Q is the absolute value |P − Q|.
#
# For example, given the mountain range represented by array A, above, with N = 12, if you take:
#
# two flags, you can set them on peaks 1 and 5;
# three flags, you can set them on peaks 1, 5 and 10;
# four flags, you can set only three flags, on peaks 1, 5 and 10.
# You can therefore set a maximum of three flags in this case.
#
# Write a function:
#
# def solution(a)
#
# that, given a non-empty zero-indexed array A of N integers, returns the maximum number of flags that can be set on the peaks of the array.
#
# For example, the following array A:
#
#     A[0] = 1
#     A[1] = 5
#     A[2] = 3
#     A[3] = 4
#     A[4] = 3
#     A[5] = 4
#     A[6] = 1
#     A[7] = 2
#     A[8] = 3
#     A[9] = 4
#     A[10] = 6
#     A[11] = 2
# the function should return 3, as explained above.
#
# Assume that:
#
# N is an integer within the range [1..400,000];
# each element of array A is an integer within the range [0..1,000,000,000].
# Complexity:
#
# expected worst-case time complexity is O(N);
# expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).

def solution(a)
  n = a.length
  peaks = []

  for i in 1...n-1 do
    peaks << i if a[i]>a[i-1] && a[i]>a[i+1]
  end

  max_flags = 0
  for flag_distance in peaks.size.downto(1) do
    break if max_flags >= flag_distance
    next if flag_distance*peaks.size > n

    flags_count = 1
    prev_peak = peaks[0]

    for peak_index in 1...peaks.size do
      break if flags_count == flag_distance
      if peaks[peak_index] - prev_peak >= flag_distance
        prev_peak = peaks[peak_index]
        flags_count += 1
      end
    end

    max_flags = [max_flags, flags_count].max
  end
  max_flags
end
