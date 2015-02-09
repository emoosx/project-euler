"""
Project Euler Problem 34
========================

145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of
their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
"""

factorial = lambda n: 1 if n == 0 else reduce(lambda x, y: x * y, xrange(1, n + 1))
sum_of_digit_factorials = lambda x: sum((factorial(y) for y in map(int, list(str(x)))))
print sum(i for i in xrange(3, 50000) if i == sum_of_digit_factorials(i))
