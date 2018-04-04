def solution(earnings)

  front = 0
  tail = 0
  max_days = 0
  last_earning = earnings[0]

  for i in 0...earnings.size do
    front += 1
    tail = i if last_earning > earnings[i]
    max_days = [max_days, front - tail].max
    last_earning = earnings[i]
  end

  max_days
end



n = gets()
earnings = gets.strip.split.map { |i| i.to_i }
puts solution(earnings)

earnings = [2, 2, 1, 3, 4, 1]
earnings = [2, 2, 9]

gets;
z=l=k=0;
gets.split.map{ |i| z=[z,k = (i=i.to_i) >= l ? k+1 : 1].max;l=i};p z
