def sieve(n)
  primes = [true]*(n+1)
  primes[0] = primes[1] = false

  i=2
  while i<=n do
    j = i
    while j*i <= n do
      primes[i*j] = false
      j+=1
    end
    i+=1
  end
  primes
end

def print_primes(n)
  primes = sieve(n)
  for i in 0...n do
    if primes[i]
      print "#{i}, "
    end
  end
end
