#!/usr/bin/env python3


from typing import Set, Tuple


def distinct_powers(a_bounds: Tuple[int, int] = (0, 0), b_bounds: Tuple[int, int] = (0, 0)) -> Set[int]:
  a_left, a_right = a_bounds
  b_left, b_right = b_bounds
  result = set()
  for a in range(a_left, a_right + 1):
    for b in range(b_left, b_right + 1):
      result.add(a**b)
  
  return result


def main():
  bounds = (2, 100)
  print(len(distinct_powers(bounds, bounds)))


if __name__ == '__main__':
  main()
