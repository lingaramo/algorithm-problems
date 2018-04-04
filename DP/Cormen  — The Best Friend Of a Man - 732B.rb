def solution(arr, k)
  counter = 0
  for i in 0...arr.size-1 do
    add = k - arr[i+1] - arr[i]
    if  add > 0
      arr[i+1] += add
      counter += add
    end
  end
  puts counter
  puts arr
end


_, k = gets.split.map{ |i| to_i }
arr = gets.split.map(&:to_i)

solution(arr, k)


solution([2, 0, 1], 5)
solution([0, 0, 0], 1)
solution([2, 4, 3, 5], 6)
