#!/usr/bin/env python3
"""
this file calculates the number
of numbers formed by a^b where
a, b are from 2 to 100
"""

from typing import Set, Tuple


def distinct_powers(a_bounds: Tuple[int, int] = (0, 0),
    b_bounds: Tuple[int, int] = (0, 0)) -> Set[int]:
    """
    function that returns set of
    all combinations of a^b where
    a: [a_left; a_right]
    b: [b_left; b_right]
    """
    a_left, a_right = a_bounds
    b_left, b_right = b_bounds
    result = set()
    for base_a in range(a_left, a_right + 1):
        for exponent_b in range(b_left, b_right + 1):
            result.add(base_a**exponent_b)
    return result


def main():
    """
    main function that prints answer for
    the task and provide arguments of it
    task: count distinct numbers that are
    get by combining all a**b for a and b
    from 2 to 100
    """
    bounds = (2, 100)
    print(len(distinct_powers(bounds, bounds)))


if __name__ == '__main__':
    main()
