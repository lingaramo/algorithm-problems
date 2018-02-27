def sum(A, M)
    for i in xrange(0,N):
        sum = 0
        for j in xrange(i,N):
            sum += A[j]
            if sum == M:
                return true
            if sum > M:
                break
    return false


def (n, A, B, min):
    return false if A < min && B < min
    return true if A % min == 0 && B % min == 0
    rest_of_A = (A - min)
    rest_of_B = (B - min)
    if rest_of_A / min > 1
    n_A = n - 1 - rest_of_A/min
    n_B = n - n_A

    if rest_of_A == 0 or rest_of_A >= min :
        # remaining_n = n-1-rest_of_A/min
        if rest_of_A/min + B/min  >= n-1
            return true

    if rest_of_B == 0 or rest_of_B >= min :
        # remaining_n = n-1-rest_of_B/min
        if rest_of_B/min + A/min  >= n-1
            return true

            return false
