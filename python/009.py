# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def is_pythagorean(a, b, c):
    return a * a + b * b == c * c


for a in range(1, 1001):
    for b in range(a, 10001-a):
        c = 1000 - a - b
        if a + b + c == 1000:
            if is_pythagorean(a, b, c):
                print a * b * c
