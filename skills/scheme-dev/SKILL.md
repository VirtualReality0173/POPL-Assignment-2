---
name: scheme-dev
description: Develop, debug, test, and review functional programs using Racket 8.x and the restricted Racket base environment. Use for recursive list processing, binary trees, higher-order functions, and functional programming assignments.
---

# Scheme Development Skill

## 1. Environment

- Language: Scheme
- Implementation: Racket 8.x
- Language declaration: `#lang racket/base`
- Run programs using:
  `racket filename.rkt`
- Files must contain definitions only.
- Do not execute functions at the top level unless explicitly requested.
- The grader may append its own function calls.

## 2. Coding conventions

- Use descriptive function names in lowercase with hyphens.
- Prefer functional programming and recursion.
- Use `define`, `lambda`, `let`, `let*`, and `letrec` appropriately.
- Use pattern recognition through `null?` and `pair?`.
- Avoid mutation and side effects.
- Pass state through function arguments.
- Prefer tail recursion where natural.
- Keep functions small and independently testable.
- Use comments to explain non-obvious logic.

## 3. Restricted built-in functions

For assignments with restricted Scheme environments, use only the functions explicitly permitted by the specification.

Typical permitted functions include:

- Definitions and control: `define`, `lambda`, `let`, `let*`, `letrec`, `if`, `cond`, `and`, `or`, `not`, `begin`, `quote`.
- List operations: `cons`, `car`, `cdr`, `list`, `null?`, `pair?`.
- Lookup: `eq?`, `assq`, `assoc`.
- Arithmetic and comparisons: `+`, `-`, `*`, `<`, `>`, `<=`, `>=`, `=`, `max`.
- Output: `display`, `newline`.

Additional functions must only be used when explicitly permitted by the assignment.

Never assume that a standard Scheme or Racket library function is allowed.

## 4. Problem-solving approach

For every problem:

1. Understand the input and expected output.
2. Identify the recursive structure.
3. Determine the base cases.
4. Implement one function at a time.
5. Explain how recursive calls reduce the problem.
6. Test small examples before larger inputs.
7. Check empty lists and deeply nested structures.
8. Verify compliance with the permitted built-ins.

For higher-order functions:

- Understand the function's input and output.
- Use `lambda` to create functions when required.
- Pass predicates and transformations as arguments.
- Avoid unnecessary duplication of recursive logic.

## 5. Testing conventions

Test:

- Empty lists.
- Single-element lists.
- Nested lists.
- Deeply nested structures.
- Different tree shapes.
- Left-skewed and right-skewed trees.
- Boundary conditions.
- Large inputs where performance matters.

Verify exact output formatting, including parentheses, list structure, and newlines.

## 6. Self-review checklist

Before presenting code, verify:

- [ ] File starts with `#lang racket/base`.
- [ ] All required function names and arities are correct.
- [ ] Every recursive function has correct base cases.
- [ ] Empty-list handling is correct.
- [ ] No prohibited built-ins are used.
- [ ] No mutation or `set!` is used.
- [ ] No unnecessary top-level function calls exist.
- [ ] All output formatting requirements are satisfied.
- [ ] Functions work independently.
- [ ] Deep recursion and large inputs have been considered.
- [ ] Code runs under Racket 8.x.

## 7. Common AI failure modes in Scheme

Watch for these mistakes:

1. Using `map`, `filter`, `append`, `reverse`, or `length` when prohibited.
2. Using `set!` or mutable data structures.
3. Confusing `null?` with `pair?`.
4. Incorrect handling of nested lists.
5. Incorrect recursive termination conditions.
6. Reversing traversal order in binary trees.
7. Returning an incorrect list structure.
8. Using `display` where a returned value is expected, or vice versa.
9. Forgetting that empty lists are valid inputs.
10. Producing code that works for shallow nesting but fails for deep nesting.
11. Using unsupported Racket functions that are not in the assignment's whitelist.

## 8. Assignment-specific restrictions

For CS F301 PPL Assignment 2:

- Use only the built-ins listed in the assignment.
- S2 additionally permits `read`.
- Do not use `length`, `append`, `reverse`, `map`, `filter`, `member`, `memq`, `list-ref`, or `list-tail`.
- Implement required helpers such as `my-length` and `my-map` yourself.
- Do not use vectors, hash tables, strings, or loops.
- Do not use mutation or global state.
- Do not print anything when loading the file.
- Preserve the required filenames and function signatures.

## 9. Response requirements

When assisting with an assignment:

- Work on one function or unit of work at a time.
- Explain the functional logic before or alongside the implementation.
- Provide independently testable code.
- Never claim tests passed without actual execution.
- Help the student understand recursion and higher-order functions.
- Prioritize correctness, specification compliance, and clarity.
