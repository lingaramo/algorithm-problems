def solution(a, m, n)

  a = a.each_with_index.map { |x,i| x.map { |xx| [xx, i] } }.flatten(1)
  a = a.sort_by { |aa| aa[0] }

  back = 0
  front = m*n-1
  counter = [m]*n


  while back <= front
    if counter[a[back][1]] - 1 > 0
      move_back = a[front][0] - a[back+1][0]
    else
      move_back = nil
    end

    if counter[a[front][1]] - 1 > 0
      move_front = a[front-1][0] - a[back][0]
    else
      move_front = nil
    end

    if move_front && move_front # both possibles
      if move_front > move_back
        # move_back
        counter[a[back][1]] -= 1
        back += 1
      else
        # move_front
        counter[a[front][1]] -=1
        front -= 1
      end
    else
      if move_back
        # move_back
        counter[a[back][1]] -= 1
        back += 1
      elsif move_front
        # move_front
        counter[a[front][1]] -=1
        front -= 1
      else
        return a[front][0]-a[back][0]
      end
    end
  end

  a[front][0]-a[back][0]
end

a =[]
n, m = gets.split().map { |i| i.to_i }
for i in 0...n do
	a << gets.split().map { |i| i.to_i }
end

puts solution(a, m, n)

a = [[10, 20, 30], [40, 50, 60], [70, 80, 90], [100, 110, 120]]
m = 3
n = 4
solution(a,m,n)

a= [[1],[2]]
m=1
n=2
solution(a,m,n)

a = [[1]]
m=1
n=1
solution(a,m,n)

a = [[1]]
m=1
n=1
solution(a,m,n)

a = [[1]*1000, [2]*1000]
m = 1000
n = 2
solution(a,m,n)

a = [1000.times.map { |i| i }, 1000.times.map { |i| i }.reverse]
m = 1000
n = 2
solution(a,m,n)

a = [[12, 16, 67, 43], [7, 17, 68, 48], [14, 15, 77, 54]]
m = 4
n = 3
solution(a,m,n)

a = [[1, 1, 1], [3, 3, 3], [2, 2, 2]]
m = 3
n = 3
solution(a,m,n)
