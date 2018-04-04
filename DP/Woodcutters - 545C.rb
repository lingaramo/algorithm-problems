def solution(arr, i, last)
  return 1 if i == arr.size-1
  if arr[i][0] - arr[i][1] > last
    return 1 + solution(arr, i+1, arr[i][0])
  elsif arr[i][0] + arr[i][1] < arr[i+1][0]
    return 1 + solution(arr, i+1, arr[i][0] + arr[i][1])
  else
    return solution(arr, i+1, arr[i][0])
  end
end

def solution(arr)
  count = 0
  last = -2<<2048
  for i in 0...arr.size-1 do
    if arr[i][0] - arr[i][1] > last
      count += 1
      last = arr[i][0]
    elsif arr[i][0] + arr[i][1] < arr[i+1][0]
      count += 1
      last = arr[i][0] + arr[i][1]
    else
      last = arr[i][0]
    end
  end
  count += 1
end

n = gets.to_i
arr = []
n.times do
  arr << gets.split.map(&:to_i)
end
puts solution(arr)





arr = [[1, 2], [2, 1], [5, 10], [10, 9], [20, 1]]

arr = []
99999.times do
  arr << Random.rand(1000000000)
end

arr = arr.uniq.sort

for i in 0...arr.size do
  arr[i] = [arr[i], Random.rand(100000000)]
end
