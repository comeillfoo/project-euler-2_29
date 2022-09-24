#!/usr/bin/env python3
"""
test module covers some features of
distinct_powers function
"""
import sys
sys.path.append("../..")

from scripts.py.distinct_powers import distinct_powers


import pytest


@pytest.mark.parametrize("border", range(101))
def test_empty_set(border: int) -> None:
    """
    test covers returning the empty set
    if there is a short range between borders
    """
    assert set() == distinct_powers((border, border - 1), (border, border - 1))



@pytest.mark.parametrize("border", range(101))
def test_single_element_set(border: int) -> None:
    """
    test covers the correctness of calculating the
    numbers that stored into resulting set
    """
    assert {border**border} == distinct_powers((border, border), (border, border))


@pytest.mark.parametrize("border", range(101))
def test_set_of_couples(border: int) -> None:
    """
    test covers the same as the test_single_element_set
    but for the couples
    """
    expected_set = set([border**border, border**(border + 1)])
    assert expected_set == distinct_powers((border, border), (border, border + 1))


@pytest.mark.parametrize("border", range(101))
def test_set_of_quads(border: int) -> None:
    """
    test covers the same as the test_single_element_set
    but for the quads
    """
    expected_set = set([border**border, border**(border + 1),
      (border + 1)**border, (border + 1) ** (border + 1)])
    assert expected_set == distinct_powers((border, border + 1), (border, border + 1))
