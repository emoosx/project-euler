from heapq import merge
import itertools


def triangulars():
    n = 1
    while True:
        yield (n * (n + 1)) / 2
        n += 1

def pentagonals():
    n = 1
    while True:
        yield (n * (3 * n - 1)) / 2
        n += 1

def hexagonals():
    n = 1
    while True:
        yield n * (2 * n - 1)
        n += 1

grouped =  itertools.groupby(merge(triangulars(), pentagonals(), hexagonals()))

count = 0
for key, group in grouped:
    g = list(group)
    if len(g) == 3:
        count += 1
        if count == 3:
            print g[0]
            break
