"""
Project Euler Problem 19
========================

You are given the following information, but you may prefer to do some
research for yourself.

  * 1 Jan 1900 was a Monday.
  * Thirty days has September,
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
    And on leap years, twenty-nine.
  * A leap year occurs on any year evenly divisible by 4, but not on a
    century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth
century (1 Jan 1901 to 31 Dec 2000)?
"""
from datetime import date, timedelta

start = date(1901, 1, 1)
end = date(2000, 12, 31)
days = (start + timedelta(day + 1) for day in xrange((end-start).days))
print len(filter(lambda x: x.weekday() == 6 and x.day == 1, days))
