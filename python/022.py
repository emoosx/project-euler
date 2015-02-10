value = lambda x: sum((ord(ch) - 64 for ch in x))

with open("p022_names.txt", "rb") as f:
    names = sorted(f.readlines()[0].split(","))
    names = [x[1:-1] for x in names]
    print sum((value(x) * (names.index(x) + 1)) for x in names)
