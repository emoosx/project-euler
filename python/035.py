"""
Project Euler Problem 35
========================

The number, 197, is called a circular prime because all rotations of the
digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37,
71, 73, 79, and 97.

How many circular primes are there below one million?
"""
from lib.primes import is_prime, primes

rotate = lambda s, r: s[-r:] + s[:-r]
prime_rotations = lambda n:  map(int, [rotate(str(n), x + 1) for x in range(len(str(n)))])
is_circular_prime = lambda n: reduce(lambda x, y: x and y,  map(is_prime, prime_rotations(n)), True)
print len(filter(is_circular_prime, primes(1000000 - 1)))
