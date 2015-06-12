with open('resources/triangle.txt') as f:
    pyramid = [map(int, line.rstrip('\r\n').split()) for line in f]

def get_maximal_total(pyramid):
    for i in range(1, len(pyramid)):
        for j, num in enumerate(pyramid[i]):
            pyramid[i][j] = max(pyramid[i - 1][j] + pyramid[i][j], pyramid[i - 1][j + 1] + pyramid[i][j])
    return pyramid[-1][0]

print get_maximal_total(pyramid[::-1])
