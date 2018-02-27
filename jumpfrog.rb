def fibo(n)
  fib = [0]*(n+1)
  fib[0] = 0
  fib[1] = 1

  for i in 2..n do
    fib[i] = fib[i-1] + fib[i-2]
  end
  fib
end


def solution(a)
  a << 1
  @fib = fibo(10)
  @jumps_list

  def jump(a, total_jumps)

    @jumps_list << total_jumps if a == []

    for i in 0...a.size do
      next if a[i] == 0
      jump(a[i...a.size], total_jumps + 1) if a[i] == 1 && @fib.include?(a[i])
    end
  end
  binding.pry
  @jumps_list
end

solution([0,0,0,1,1,0,1,0,0,0,0])
