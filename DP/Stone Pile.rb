# # http://acm.timus.ru/problem.aspx?space=1&num=1005
# def solution(arr)
#   puts recursive(0, 0, arr)
# end
#
# def recursive(pileA, pileB, arr)
#   return (pileA - pileB).abs if arr.size == 0
#   [recursive(pileA + arr[0], pileB, arr[1...arr.size]), recursive(pileA, pileB + arr[0], arr[1...arr.size])].min
# end

def solution(piedras)
  posibles_pilas = Array.new(piedras.reduce(:+)+1, false)
  n = piedras.reduce(:+)
  posibles_pilas[0] = true

  piedras.each do |piedra|
    # Lo hacemos al revez para no volver a usar la misma piedra dos veces
    posibles_pilas.size.downto(0) do |i|
      # binding.pry if i == 4
      if posibles_pilas[i-piedra] == true && (i-piedra) >= 0
        posibles_pilas[i] = true
        # checkear solucion
      end
    end
  end

  min = 2<<2048
  for i in 0..n do
    min = [min, (n - 2*i).abs].min if posibles_pilas[n - i] && posibles_pilas[i] && (n - i) >= 0
  end
  min
end

n = gets
arr = gets.split.map(&:to_i)
solution(arr)
