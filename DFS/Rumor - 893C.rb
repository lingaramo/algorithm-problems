# http://codeforces.com/problemset/problem/893/C

def solution(frindships, price)
  tree = Hash.new { |k, v| k[v] = true }
  price.size.times { |i| tree[i+1] }

  frindships.each do |friendA, friendB|
    if price[friendA-1] > price[friendB-1]
      tree[friendA] = false
    else
      tree[friendB] = false
    end
  end

  total = 0
  tree.each do |k,v|
    if v
      total += price[k-1]
    end
  end
  total
end

n, m = gets.strip.split().map { |i| i.to_i }
price = gets.strip.split.map { |i| i.to_i }

friendship = []
m.times do
  friendship << gets.strip.split().map { |i| i.to_i }
end

puts solution(friendship, price)


def doFill(x, y)
  nodes = [[x,y]]
  visited = Array.new(10) { Array.new(10, false) }
  result = 0
  iterations = 0
  while nodes.empty? == false do
    iterations += 1
    node = nodes.pop
    next if node[0] < 0 || node[0] >= 10
    next if node[1] < 0 || node[1] >= 10
    next if visited[node[0]][node[1]]

    result += 1
    visited[node[0]][node[1]] = true

    nodes.push([node[0] + 1, node[1]]) # if !visited[node[0] + 1][node[1]]
    nodes.push([node[0], node[1] + 1]) # if !visited[node[0]][node[1] + 1]
    nodes.push([node[0] - 1, node[1]]) # if !visited[node[0] - 1][node[1]]
    nodes.push([node[0], node[1] - 1]) # if !visited[node[0]][node[1] - 1]
  end
  [result, iterations]
end


def solution(frindships, price)
  visited = Hash.new(price.size, false)

  
end
