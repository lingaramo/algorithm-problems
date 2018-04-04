def solution(arr)
  if arr.size == 1
    return 1 if arr[0] == 0
    return 0 if arr[0] == 1
  end

  initial_value = arr.reduce(:+)
  return initial_value - 1 if initial_value == arr.size

  acumulator = initial_value
  max_value = 0

  for i in 0...arr.size do
    acumulator = [initial_value, acumulator + (arr[i] == 1 ? -1 : 1)].max
    max_value = [max_value, acumulator].max
  end
  max_value
end

n = gets()
puts solution(gets.split.map(&:to_i))

arr = [1, 0, 0, 1, 0]
arr = [1, 0, 0, 1]
