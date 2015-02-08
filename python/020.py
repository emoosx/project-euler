"""
Project Euler Problem 20
========================

n! means n * (n - 1) * ... * 3 * 2 * 1

Find the sum of the digits in the number 100!
"""

sum_digit = lambda x: sum(map(int, list(str(x))))
print sum_digit(reduce(lambda x, y: x * y, xrange(1, 100+1)))
