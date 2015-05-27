"""
Project Euler Problem 17
========================

If the numbers 1 to 5 are written out in words: one, two, three, four,
five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written
out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
forty-two) contains 23 letters and 115 (one hundred and fifteen) contains
20 letters. The use of "and" when writing out numbers is in compliance
with British usage.
"""

import math

numbers = {
    0: 'zero',
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
    5: 'five',
    6: 'six',
    7: 'seven',
    8: 'eight',
    9: 'nine',
    10: 'ten',
    11: 'eleven',
    12: 'twelve',
    13: 'thirteen',
    14: 'fourteen',
    15: 'fifteen',
    16: 'sixteen',
    17: 'seventeen',
    18: 'eighteen',
    19: 'nineteen',
}

bigger = {
    20: 'twenty',
    30: 'thirty',
    40: 'forty',
    50: 'fifty',
    60: 'sixty',
    70: 'seventy',
    80: 'eighty',
    90: 'ninety',
    100: 'hundred',
    1000:'thousand'
}

def digits(no, a=True):
    return ' and ' + numbers[no] if a else numbers[no]

def tens(no, default=''):
    if no < 20:
        return digits(no)
    elif no < 100:
        return default + bigger[no/10*10] + numbers[no%10] if no % 10 != 0 else default + bigger[no/10*10]
    elif no < 1000:
        return numbers[no/100] + " " + bigger[100] + tens(no%100, default=' and ') if no % 100 != 0 else numbers[no/100] + " " + bigger[100]
    return 'one thousand'

count = lambda x: len(''.join(tens(x).split()))
print sum(count(x) for x in range(1, 1001))
