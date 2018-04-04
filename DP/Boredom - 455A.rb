# Solucion recursiva ineficiente. Se me ocurrio a mi
def solution(arr)
  counter = Hash.new { |k, v| k[v] = 0 }
  arr.each do |value|
    counter[value] += 1
  end

  counter = counter.to_a.sort_by { |element| element[0] }
  max_value = solve_recursively(counter)
end

def solve_recursively(counter)
  return 0 if counter.size == 0
  return counter[0][0]*counter[0][1] if counter.size == 1
  if counter[1][0] - counter[0][0] == 1
    return [counter[0][1]*counter[0][0] + solve_recursively(counter[2...counter.size]), solve_recursively(counter[1...counter.size])].max
  end
  counter[0][1]*counter[0][0] + solve_recursively(counter[1...counter.size])
end

# Solucion ineficiente, codeforces tiro el hint

def solution(arr)
  dp = Array.new(arr.max+2, 0)
  arr.each { |a| dp[a] += 1 }

  for i in 2...dp.size do
    dp[i] = [dp[i-2] + i*dp[i], dp[i-1]].max
  end
  dp.last
end

n = gets()
arr = gets.split.map(&:to_i)

puts solution(arr)

arr = [1, 2, 1, 3, 2, 2, 2, 2, 3]
solution(arr)
arr = [1, 2, 3]
solution(arr)
arr = [1, 2]
solution(arr)
