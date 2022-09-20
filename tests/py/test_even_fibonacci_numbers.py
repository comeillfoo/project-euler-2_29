#!/usr/bin/env python3
import sys
sys.path.append("../..")

from scripts.py.even_fibonacci_numbers import fibonacci_less_than


import pytest


@pytest.mark.parametrize("test_limit,expected_sum", [(0, 0), (1, 0), (2, 0), (3, 2), (4, 2), (5, 2), (6, 2), (8, 2), (9, 10), (90, 44)])
def test_small_ints(test_limit: int, expected_sum: int) -> None:
  assert sum(filter(lambda x: x % 2 == 0, fibonacci_less_than(test_limit))) == expected_sum
