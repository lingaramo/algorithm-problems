def solution(days)
  prev = nil
  rest_days = 0
  days.each_with_index do |activity, index|
    (rest_days += 1; prev = 0; next) if activity == 0
    (rest_days += 1; prev = 0; next) if activity == prev && activity != 3
    if activity == 3
      days[index] = 2 if prev == 1
      days[index] = 1 if prev == 2
    end
    prev = days[index]
  end
  rest_days
end

_ = gets
puts solution(gets.split.map(&:to_i))

solution([1, 3, 2, 0])
solution([1, 3, 3, 2, 1, 2, 3])
solution([2, 2])
