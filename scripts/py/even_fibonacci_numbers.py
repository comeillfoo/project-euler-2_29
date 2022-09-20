#!/usr/bin/env python3
from typing import Iterable


def fibonacci_less_than(n: int) -> Iterable[int]:
  prev = 0
  curr = 1
  while (curr < n):
    temp = curr
    curr = prev + curr
    prev = temp
    if (curr >= n):
      break
    yield curr


def main(limit: int) -> None:
  print(sum(filter(lambda x: x % 2 == 0, fibonacci_less_than(limit))))


if __name__ == '__main__':
  main(4_000_000)
