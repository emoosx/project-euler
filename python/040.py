"""
Project Euler Problem 40
========================

An irrational decimal fraction is created by concatenating the positive
integers:

                  0.123456789101112131415161718192021...
                               ^

It can be seen that the 12th digit of the fractional part is 1.

If d[n] represents the n-th digit of the fractional part, find the value
of the following expression.

    d[1] * d[10] * d[100] * d[1000] * d[10000] * d[100000] * d[1000000]
"""

number = ''.join(str(x) for x in xrange(1, 1000001))
print reduce(lambda x, y: x * y, map(int, (number[x-1] for x in [1, 10, 100, 1000, 10000, 100000, 1000000])))
