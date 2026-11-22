---
name: prolog-dev
description: Develop, debug, test, and review Prolog programs using SWI-Prolog 9.x. Use for logic programming, recursive predicates, backtracking, constraint-based puzzles, arithmetic expression generation, and Prolog assignments.
---

# Prolog Development Skill

## 1. Environment

- Language: Prolog
- Implementation: SWI-Prolog 9.x
- Run files using:
  `swipl -q -f filename.pl -g main -t halt`
- Run individual predicates using:
  `swipl -q -f filename.pl -g "goal" -t halt`

## 2. Coding conventions

- Use descriptive predicate names in lowercase with underscores.
- Use uppercase names for variables.
- Keep predicates small and focused.
- Prefer declarative programming over imperative programming.
- Use recursion, pattern matching, unification, and backtracking.
- Add comments explaining non-obvious logic.
- Avoid unnecessary cuts (`!`).
- Ensure predicates behave correctly for empty lists and boundary cases.
- Do not use global state or mutable variables.

## 3. Problem-solving approach

For every problem:

1. Understand the specification and identify the required input/output.
2. Break the problem into independent predicates.
3. Implement one predicate at a time.
4. Explain the logical meaning of each predicate.
5. Test each predicate independently.
6. Combine predicates only after individual verification.
7. Review correctness, termination, and edge cases.

Think declaratively: describe the relationships that must hold rather than writing procedural instructions.

## 4. Testing conventions

- Test normal inputs.
- Test empty lists and minimum-size inputs.
- Test boundary conditions.
- Test invalid inputs where applicable.
- Check whether predicates succeed, fail, or produce multiple solutions as intended.
- Use SWI-Prolog's command-line interface for verification.
- Ensure predicates do not loop indefinitely or raise unintended errors.

## 5. Self-review checklist

Before presenting code, verify:

- [ ] Predicate names and arities match the specification.
- [ ] All required clauses are present.
- [ ] Unification and backtracking behave correctly.
- [ ] Recursive predicates have appropriate base cases.
- [ ] The implementation terminates for valid inputs.
- [ ] No unintended duplicate solutions are generated.
- [ ] All edge cases have been considered.
- [ ] Code runs in SWI-Prolog 9.x.
- [ ] No prohibited built-ins or constructs are used.
- [ ] No initialization directives or unwanted printing are present.

## 6. Common AI failure modes in Prolog

Watch for these common mistakes:

1. Confusing `=` (unification) with `is` (arithmetic evaluation).
2. Using arithmetic expressions without evaluating them.
3. Incorrect variable instantiation before arithmetic comparisons.
4. Missing base cases in recursive predicates.
5. Accidentally generating duplicate solutions.
6. Using cuts that remove valid solutions.
7. Incorrect list decomposition and reconstruction.
8. Confusing atoms, strings, and numbers.
9. Ignoring backtracking behavior.
10. Producing code that works for one example but fails on general inputs.

## 7. Assignment-specific restrictions

For assignments that specify restricted libraries or constructs:

- Follow the exact permitted built-in and library list.
- Never introduce prohibited predicates for convenience.
- Do not use `assert`, `retract`, or global variables when prohibited.
- Do not print additional output unless explicitly requested.
- Do not hard-code expected answers when derivation is required.
- Preserve the required file names and output formats.

## 8. Response requirements

When helping with an assignment:

- Work on one predicate or unit of work at a time.
- Explain the logic before or alongside the implementation.
- Provide small, independently testable code sections.
- Never assume code has passed without actual test results.
- Ask the user to run the code and share errors when necessary.
- Prioritize correctness and understanding over code brevity.
