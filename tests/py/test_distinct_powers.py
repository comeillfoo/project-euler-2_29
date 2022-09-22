#!/usr/bin/env python3
import sys
sys.path.append("../..")

from scripts.py.distinct_powers import distinct_powers


import pytest


@pytest.mark.parametrize("border", range(101))
def test_empty_set(border: int) -> None:
  assert set() == distinct_powers((border, border - 1), (border, border - 1))



@pytest.mark.parametrize("border", range(101))
def test_single_element_set(border: int) -> None:
  assert {border**border} == distinct_powers((border, border), (border, border))


@pytest.mark.parametrize("border", range(101))
def test_set_of_couples(border: int) -> None:
  first = border**border
  second = border**(border + 1)
  expected_set = set([border**border, border**(border + 1)])
  assert expected_set == distinct_powers((border, border), (border, border + 1))


@pytest.mark.parametrize("border", range(101))
def test_set_of_quads(border: int) -> None:
  expected_set = set([border**border, border**(border + 1), (border + 1)**border, (border + 1) ** (border + 1)])
  assert expected_set == distinct_powers((border, border + 1), (border, border + 1))
