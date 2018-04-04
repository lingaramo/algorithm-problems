def solve(a, b, a_max, b_max)
  @posibilities = Array.new(2, Array.new(a+1, Array.new(b+1, false)))
  @posibilities[0][0][0] = 1
  @posibilities[1][0][0] = 1

  def solution(a, b, a_max, b_max, flag)
    binding.pry if a == 1 && b == 1 && flag == 1
    return @posibilities[flag][a][b] if @posibilities[flag][a][b]

    # return 1 if (a == 0 && b == 0)

    posibilities_count = 0
    if flag == 0
      for i in 1..a_max do
        posibilities_count += solution(a-i, b, a_max, b_max, 1) if (a-i >= 0)
      end
    else
      for i in 1..b_max do
        posibilities_count += solution(a, b-i, a_max, b_max, 0) if (b-i >= 0)
      end
    end
    binding.pry if a == 1 && b == 1 && flag == 1

    @posibilities[flag][a][b] = posibilities_count
    posibilities_count
  end

  solution(a, b, a_max, b_max, 0)
  solution(a, b, a_max, b_max, 1)
  @posibilities # No se que puta devolver porque no se que da esto.
                # Supongo que @posibilities[0][a][b] + @posibilities[1][a][b]
end

n1, n2, k1, k2 = map(int, raw_input().split())
D = {}

def solve(a1, b1, aa, bb):
    if a1 < 0 or b1 < 0: return 0
    if aa > k1 or bb > k2: return 0
    if a1 == 0 and b1 == 0: return 1
    if (a1, b1, aa, bb) in D: return D[(a1, b1, aa, bb)]
    D[(a1, b1, aa, bb)] = solve(a1 - 1, b1, aa + 1, 0) + solve(a1, b1 - 1, 0, bb + 1)
    return D[(a1, b1, aa, bb)] % (10 ** 8)

print(solve(n1, n2, 0, 0))


mod = 10 ** 8
n1, n2, k1, k2 = map(int, raw_input().split())
dp = {}

def gao(a1, b1, aa, bb):
    if a1 < 0 or b1 < 0: return 0
    if aa > k1 or bb > k2: return 0
    if a1 == 0 and b1 == 0: return 1
    if (a1, b1, aa, bb) in dp: return dp[(a1, b1, aa, bb)]
    dp[(a1, b1, aa, bb)] = gao(a1 - 1, b1, aa + 1, 0) + gao(a1, b1 - 1, 0, bb + 1)
    return dp[(a1, b1, aa, bb)] % mod
print gao(n1, n2, 0, 0) % mod

def solution(soldiers, horses, soldiers_max, horses_max)
  @soldiers_max, @horses_max = soldiers_max, horses_max
  @memo = {}

  def solve(soldiers, horses, soldiers_count, horses_count)
    return 0 if [soldiers, horses].min < 0
    return 0 if soldiers_count > @soldiers_max || horses_count > @horses_max
    return 1 if soldiers == 0 && horses == 0
    return @memo[[soldiers, horses, soldiers_count, horses_count]] if @memo[[soldiers, horses, soldiers_count, horses_count]]
    @memo[[soldiers, horses, soldiers_count, horses_count]] = solution(soldiers-1, horses, soldiers_count+1, 0) +
                                                             solution(soldiers, horses+1, 0, horses_count+1)
    return @memo[[soldiers, horses, soldiers_count, horses_count]] % 100000000
  end

  solve(soldiers, horses, 0, 0)
end
solution(1, 2, 1, 2)
solution(2, 3, 1, 2)
solution(2, 1, 1, 10)

def solution(soldiers, horses, soldiers_max, horses_max)
  posibilities = Array.new(soldiers+1) { Array.new(horses+1, 0) }
  # posibilities[0][0] = 1
  posibilities[0][1], posibilities[1][0] = 1, 1

  soldiers_num, horses_num = 0, 0
  while soldiers_num < soldiers && horses_num < horses do
    horses_num += 1 if horses_num < horses
    soldiers_num += 1 if soldiers_num < soldiers

    for horse in 0..horses_num do
      counter = 0
      for i in 0..soldiers_max do
        counter += posibilities[horse][soldiers_num-i] if soldiers_num-i >= 0
      end
      posibilities[horse][soldiers_num] = counter
    end

    for soldier in 0..soldiers_num do
      counter = 0
      for i in 0..horses_max do
        counter += posibilities[horses_num-i][soldier] if horses_num-i >= 0
      end
      posibilities[horses_num][soldier] = counter
    end
  end
  return posibilities
  posibilities[soldier-1][horses-1] + posibilities[horses-1][soldier-1]
end
solution(1, 2, 1, 2)
solution(2, 3, 1, 2)
solution(2, 1, 1, 10)
# puts solve(*gets.split.map(&:to_i))


# solve(2, 3, 1, 2)
# solve(1, 1, 1, 1)
# solve(2,1,1,10)
# solve(2, 4, 1, 1)
# solution(3, 2, 2, 1, 5)
