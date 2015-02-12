import math


def eratosthenes():
    """ Generate an infinite sequence of prime numbers"""
    # http://code.activestate.com/recipes/117119/
    D = {}
    n = 2
    while True:
        if n not in D:
            # n is a new prime number
            yield n
            D[n * n] = [n]
        else:
            # n is a composite number
            for c in D[n]:
                D.setdefault(c + n, []).append(c)
            del D[n]
        n += 1

def primes(n):
    """ Prime numbers up to n"""
    primes = eratosthenes()
    for p in primes:
        if p <= n:
            yield p
        else:
            return

def is_prime(num):
    """ Check whether a number is prime """
    if num < 2: return False
    elif num < 4: return True
    elif not num % 2: return False
    elif num < 9: return True
    elif not num % 3: return False
    else:
        for n in range(5, int(math.sqrt(num)) + 1, 6):
            if not num % n:
                return False
            elif not num % (n + 2):
                return False
    return True
