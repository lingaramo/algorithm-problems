def solution(arr)
  counter = 1
  max = 0
  for i in 1...arr.size do
    if arr[i] > arr[i-1]
      counter += 1
    else
      max = [max, counter].max
      counter = 1
    end
  end
  max = [max, counter].max
end

_ = gets
puts solution(gets.split.map(&:to_i))

solution([1, 7, 2, 11, 15])
solution([100, 100, 100, 100, 100, 100])
solution([1, 2, 3])
