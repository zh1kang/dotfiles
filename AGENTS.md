# Agent Instructions

Read this file before doing anything else.
These are the global rules for all agents working in this repository.

The highest priority is code quality.
Correctness, clarity, maintainability, and robust design matter more than speed of delivery.

Do not optimize for making the current request merely appear complete.
Optimize for leaving the codebase better, safer, and easier to maintain.

## Core Principles

- Prefer correctness over convenience.
- Prefer clarity over cleverness.
- Prefer maintainability over short-term productivity.
- Prefer robust design over quick fixes.
- Prefer simplicity over unnecessary complexity.
- Prefer doing it right over doing it quickly.
- Prefer honest failure over fragile success.

## Engineering Standards

Do not introduce fragile, ad hoc, or short-term solutions into the codebase.

Avoid any change that:

- Works only for the immediate case.
- Bypasses the underlying problem.
- Relies on brittle assumptions.
- Adds special-case logic without a clear design reason.
- Suppresses errors instead of resolving them.
- Makes future behavior harder to reason about.
- Increases the likelihood of future regressions.
- Trades long-term maintainability for short-term completion.

If the requested feature cannot be completed cleanly with the current architecture, stop and explain the limitation.

Do not force an implementation that weakens the codebase.
Do not commit partial solutions that appear complete but leave known design problems unresolved.
Do not hide limitations or uncertainty.

Instead, clearly explain what is missing, why the current design blocks the request, and what proper architectural change is needed.

## Fix Root Causes

When something is broken, fix the underlying cause.

Do not patch symptoms.
Do not add fragile logic around a flawed design.
Do not preserve a broken abstraction simply because other code currently depends on it.

If the clean fix requires changing existing APIs, behavior, or structure, make the change.
Backward compatibility is not a default priority unless explicitly required by the task.

Prioritize:

1. Correctness.
2. Clear design.
3. Maintainability.
4. Robustness.
5. Simplicity.
6. Backward compatibility only when explicitly required.

## Production-Quality Standard

All code should be written as if it will be maintained long-term.

Every change should be:

- Clear.
- Well-designed.
- Type-safe where applicable.
- Tested where appropriate.
- Easy to review.
- Easy to modify later.
- Consistent with the surrounding architecture.

Do not add code that merely makes tests pass while weakening the system design.

Do not add temporary code unless it is explicitly justified and unavoidable.
Even then, prefer a proper design-level fix.

## Testing and Validation

Before claiming a task is complete, verify it.

For bug fixes:

- Reproduce the bug first when possible.
- Understand why it happens.
- Fix the root cause.
- Add or update tests that would have caught the issue.
- Run the relevant tests.

For features:

- Validate the expected behavior.
- Cover important edge cases.
- Run linting, type checks, and tests when available.
- Report any validation that could not be completed.

Do not claim success without evidence.

## End-to-End Behavior

For user-facing features, care about the full end-to-end experience.

The implementation should work from the user's perspective, not just at the unit level.

For UI work:

- Be precise about layout, spacing, alignment, and visual polish.
- Fix obvious visual issues, even if they are adjacent to the requested change.
- Do not leave awkward or broken states.
- Make the interface feel complete and intentional.

For backend or system work:

- Ensure the behavior is correct across realistic flows.
- Handle failure cases cleanly.
- Avoid hidden state, unclear side effects, and brittle control flow.

## Generated Files and External Artifacts

Do not manually edit generated files.

This includes:

- Changelogs marked as generated.
- Build outputs.
- Lockfiles, unless the dependency change requires it.
- Codegen outputs, unless they are regenerated through the proper tool.
- Any file clearly marked as auto-generated.

Use the correct generation command instead.

If the generation command is missing or broken, fix that system rather than editing generated output by hand.

## Markdown and Documentation

When writing or substantially editing long Markdown documents:

- Put each full sentence on its own line.
- Preserve normal Markdown structure.
- Do not wrap multiple sentences onto one physical line.
- Keep wording direct and unambiguous.
- Prefer plain language over vague abstractions.

Never use the em dash character.
Use a plain hyphen instead.

## Commit Messages

When writing commit messages:

- Do not add the agent name as a co-author.
- Do not add automated attribution unless explicitly requested.
- Keep the message accurate and specific.
- Do not overstate what changed.

## Dependency and Architecture Changes

Do not add new dependencies casually.

Before adding a dependency, consider whether the existing codebase can support the feature cleanly without it.

A new dependency is acceptable only when it clearly improves correctness, maintainability, or long-term simplicity.

When changing architecture:

- Make the design explicit.
- Keep boundaries clean.
- Avoid circular dependencies.
- Avoid hidden coupling.
- Prefer small, composable pieces.
- Remove obsolete code rather than preserving dead paths.

## Error Handling

Do not hide errors.

Do not catch broad exceptions unless there is a clear recovery path.

Do not replace meaningful failures with silent fallbacks.

Good error handling should:

- Preserve useful context.
- Fail clearly when the system cannot continue.
- Avoid corrupting state.
- Make debugging easier.

## Reporting Requirements

After every meaningful change, provide an honest report.

The report should include:

- What changed.
- Why it changed.
- What was validated.
- What was not validated.
- Any risks or uncertainty.
- Any remaining work.

If any part of the solution is fragile, incomplete, or based on an assumption, say so clearly.

Do not present uncertain work as finished.

## Stop Conditions

Stop and report honestly if:

- The request cannot be completed cleanly with the current architecture.
- The repository lacks the necessary structure or abstractions.
- The available APIs do not support the requested behavior.
- The correct fix requires a larger redesign.
- Tests or validation reveal a deeper issue.
- Continuing would make the codebase worse.

In these cases, explain the blocker and propose the proper fix.

Do not force a poor solution into the codebase.

## Final Rule

Never trade long-term code quality for short-term task completion.

A clean, honest, incomplete result is better than a fragile, misleading, complete-looking result.
