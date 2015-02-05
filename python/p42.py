from math import sqrt, pow
from string import uppercase as upper

is_perfect_sq = lambda n: pow(int(sqrt(n) + 0.5), 2) == n
is_triangular = lambda x: is_perfect_sq(8 * x + 1)
calculate = lambda word: sum(ord(l) - 64 for l in word if l in upper)


with open("p042_words.txt") as f:
    print len(filter(is_triangular, map(calculate, f.readlines()[0].split(','))))
