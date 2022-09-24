#!/usr/bin/env python3
"""
test module covers some features
of fibonacci_less_than function
"""
import sys
sys.path.append("../..")

from scripts.py.even_fibonacci_numbers import fibonacci_less_than


import pytest


@pytest.mark.parametrize("test_limit,expected_length", [(0, 0), (1, 0), (2, 1), (3, 2), (4, 3), (89, 9), (90, 10)])
def test_length(test_limit: int, expected_length: int) -> None:
    """
    test covers the number of elements in
    result list of fibonacci numbers
    """
    assert len(list(fibonacci_less_than(test_limit))) == expected_length


@pytest.mark.parametrize("test_limit,expected_last_number", [(2, 1), (3, 2), (4, 3), (5, 3), (6, 5), (7, 5), (8, 5), (9, 8), (14, 13), (22, 21), (35, 34), (56, 55), (90, 89)])
def test_last_element(test_limit: int, expected_last_number: int) -> None:
    """
    test covers verifying the absence
    of limit exceeding
    """
    assert list(fibonacci_less_than(test_limit))[-1] == expected_last_number


@pytest.mark.parametrize("test_limit,expected_sum", [(0, 0), (1, 0), (2, 0), (3, 2), (4, 2), (5, 2), (6, 2), (8, 2), (9, 10), (90, 44)])
def test_even_sum(test_limit: int, expected_sum: int) -> None:
    """
    test covers the task for some limits
    """
    assert sum(filter(lambda x: x % 2 == 0, fibonacci_less_than(test_limit))) == expected_sum
