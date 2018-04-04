def solution(arr)
  return 0 if arr.size < 4
 prefix, count = [0], 0
 arr.each do |a|
   prefix << prefix.last + a
 end

 for i in 1...prefix.size-2 do
   for j in 2...prefix.size-1 do
   first = prefix[i]
   second = prefix[j] - prefix[i]
   third = prefix.last - prefix[j]
   count += 1 if first == second && first == third
  end
 end
 count
end

_ = gets
puts solution(gets.split.map(&:to_i))

solution([1, 2, 3, 0, 3])
solution([0, 1, -1, 0])
solution([4, 1])
