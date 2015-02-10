print sum((x for x in xrange(1, 1000001) if str(x) == str(x)[::-1] and bin(x)[2:] == bin(x)[2:][::-1]))
