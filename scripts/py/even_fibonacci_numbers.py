#!/usr/bin/env python3
"""
module calculates sum of even fibonacci numbers that
are less than 4_000_000
"""

from typing import Iterable


def fibonacci_less_than(limit: int) -> Iterable[int]:
    """
    function returns generator that
    yields fibonacci numbers until it get
    to n
    """
    prev = 0
    curr = 1
    while curr < limit:
        temp = curr
        curr = prev + curr
        prev = temp
        if curr >= limit:
            break
        yield curr


def main(limit: int) -> None:
    """
    function that uses generator from
    fibonacci_less_than and sums only
    even numbers
    """
    print(sum(filter(lambda x: x % 2 == 0, fibonacci_less_than(limit))))


if __name__ == '__main__':
    main(4_000_000)
