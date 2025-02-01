# Lua pairs iterator skipping elements

This repository demonstrates a subtle bug in Lua related to the `pairs` iterator and nested table traversal.  If a nested table is modified during iteration, the `pairs` iterator might skip elements, leading to unexpected behavior.

## Bug Description

The provided Lua code recursively iterates through a nested table using `pairs`.  Under certain conditions (specifically, modification of the table during iteration), the iterator may skip elements.  This is because the internal iteration mechanism of `pairs` relies on the table's internal structure, which can change when modifying the table.

## Reproduction

Clone this repository and run `bug.lua`. The expected output is a traversal of all elements. However, due to the bug, some elements might be skipped.

## Solution

The `bugSolution.lua` file provides a workaround using ipairs on an array that's explicitly created from the table, which is immune to this iteration problem.  Modifying this array will not affect the iterator. See `bugSolution.lua` for a correction.