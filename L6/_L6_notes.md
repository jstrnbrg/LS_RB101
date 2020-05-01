---
layout: post
title: "RB101: Debugging & Recursion"
description: "Notes from the first module of the Launch School core curriculum"
date: 2020-02-14
feature_image:
tags: [learning, launch-school]
---

## Debugging
1. Identify the problem: Where does it come from?
2. Understand the problem: What is going wrong?
3. Implement the solution

<!--more-->

### Types of errors
- Syntax errors
    - incorrect "grammar"
    - generally stops your code from running
- Logical errors
    - incorrect logic
    - generally runs but produces unexpected result

### Pry in the terminal
- pry is a REPL (read-evaluate-print-loop)
- changing scope with `cd` e.g. jump into array
- get info about current scope using `ls`
- call methods directly within the context `methodname`
- access documentation via `show-doc`

### Pry during runtime
- `require pry` in your file
- `binding.pry` stops execution at that line
- `pry-byebug` extends pry with some additional commands: `next`, `step`, `continue`

### Recursion intro
- Recursive methods have three primary qualities:
1. They call themselves at least once.
2. They have a condition that stops the recursion e.g. `return 1 if n <= 2`.
3. They use the result returned by themselves.
- Every recursive method can be rewritten as a non-recursive (procedural) method.

### Bubble sort
- A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.


Reading:
- https://launchschool.com/posts/587959fd
- https://launchschool.com/posts/9f4c03bc#comment-53639
- https://launchschool.com/posts/8a6f4220
- https://launchschool.com/posts/587959fd#comment-54748
- https://medium.com/launch-school/recursive-fibonnaci-method-explained-d82215c5498e#.qxl7hr56e
