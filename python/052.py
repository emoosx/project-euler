"""
Project Euler Problem 52
========================

It can be seen that the number, 125874, and its double, 251748, contain
exactly the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x,
contain the same digits.
"""

lex = lambda x: ''.join(sorted(list(str(x))))
for x in xrange(1, 123456789+1):
    nums = map(lex, [x * y for y in range(2, 7)])
    unique = set(nums)
    if len(unique) == 1:
        print x
        break
