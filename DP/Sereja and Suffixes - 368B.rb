def solution(arr, positions)
  mask = Array.new(10**5+10, false)
  distinct_counter = [0]*arr.size

  n = arr.size - 1
  prev = 0
  arr.reverse.each do |value|
    unless mask[value]
      mask[value] = true
      prev += 1
    end
    distinct_counter[n] = prev
    n -= 1
  end

  positions.each do |position|
    puts distinct_counter[position-1]
  end
end

n , m = gets.split.map(&:to_i)
arr = gets.split.map(&:to_i)
positions = m.times.map { |i| gets.to_i }

solution(arr, positions)

arr = [1, 2, 3, 4, 1, 2, 3, 4, 100000, 99999]
positions = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
