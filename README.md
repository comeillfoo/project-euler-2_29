# project-euler-2_29

## Текст задания

_Цель:_ освоить базовые приёмы и абстракции функционального программирования: функции, поток управления и поток данных, сопоставление с образцом, рекурсия, свёртка, отображение, работа с функциями как с данными, списки.

В рамках лабораторной работы вам предлагается решить несколько задач [проекта Эйлер](https://projecteuler.net/archives). Список задач -- ваш вариант.

Для каждой проблемы должно быть представлено несколько решений:

1. монолитные реализации с использованием:
    * хвостовой рекурсии;
    * рекурсии (вариант с хвостовой рекурсией не является примером рекурсии);
2. модульной реализации, где явно разделена генерация последовательности, фильтрация и свёртка (должны использоваться функции reduce/fold, filter и аналогичные);
3. генерация последовательности при помощи отображения (map);
4. работа со спец. синтаксисом для циклов (где применимо);
5. работа с бесконечными списками для языков поддерживающих ленивые коллекции или итераторы как часть языка (к примеру Haskell, Clojure);
6. реализация на любом удобном для вас традиционном языке программировании для сравнения.

Требуется использовать идиоматичный для технологии стиль программирования.
Содержание отчёта:

* титульный лист;
* описание проблемы;
* ключевые элементы реализация с минимальными комментариями;
* выводы (отзыв о использованных приемах программирования).

Примечания:

* необходимо понимание разницы между ленивыми коллекциями и итераторами;
* нужно знать особенности используемой технологии и того, как работают использованные вами приемы.

## Задачи

### [Even Fibonacci numbers](https://projecteuler.net/problem=2)

#### Problem 2

Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

$$
  1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
$$

By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

### [Distinct powers](https://projecteuler.net/problem=29)

#### Problem 29

Consider all integer combinations of $a^b$ for $2 \leq a \leq 5$ and $2 \leq b \leq 5$:

$$
  \begin{align*}
    2^2=4, && 2^3=8,  && 2^4=16, && 2^5=32\\
    3^2=9, && 3^3=27, && 3^4=81, && 3^5=243\\
    4^2=16,&& 4^3=64, && 4^4=256,&& 4^5=1024\\
    5^2=25,&& 5^3=125,&& 5^4=625,&& 5^5=3125
  \end{align*}
$$

If they are then placed in numerical order, with any repeats removed, we get the following sequence of 15 distinct terms:

$$
  4, 8, 9, 16, 25, 27, 32, 64, 81, 125, 243, 256, 625, 1024, 3125
$$

How many distinct terms are in the sequence generated by $a^b$ for $2 \leq a \leq 100$ and $2 \leq b \leq 100$?

## Отчет

[Google Docs: ФП34112 Ханнанов ЛР1](https://docs.google.com/document/d/1z-0DgDbBhSBWN_4SrItvD9cGcAP-7QwzV_fbFKFT6-k/edit?usp=sharing)
