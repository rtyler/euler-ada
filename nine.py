#!/usr/bin/env python

import math
import sys

def main():
    RANGE = 1000
    for a in xrange(RANGE):
        for b in xrange(RANGE):
            if (a == 0) or (b == 0):
                continue

            c_squared = (a ** 2) + (b ** 2)
            c = math.sqrt(c_squared)
            if not c == math.floor(c):
                continue
            if (a + b + c) == 1000:
                if a < b < c:
                    print a, b, c
                    print a * b * c
    return 0

if __name__ == '__main__':
    sys.exit(main())

