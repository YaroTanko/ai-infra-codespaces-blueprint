# AGENTS.md

## Project scope
- This repository currently captures planning/design artifacts for an AI infrastructure blueprint; it does not yet contain runnable application code.
- Source-of-truth documents:
  - `read.md`: local/Codespaces setup guidance.
  - `DESIGN.md`: architecture and core-tool decisions.
  - `STAGE_TODOS.md`: staged implementation plan and stream tasks.
  - `EXECUTION_BOARD.md`: tool ownership, acceptance tests, and orchestration cadence.

## Non-negotiable workflow for agents
1. Ask one clarifying question for each new requirement until you are at least 95% confident.
2. After confidence is reached, write detailed design documentation for the requested change.
3. Break implementation into explicit stages with detailed to-do lists per stage.
4. Save that design package under:
   - `~/Developer/Cursor-d/<project-name>/`
   - Use clear filenames such as `DESIGN_<task>.md` and `STAGE_TODOS_<task>.md`.

## Change boundaries and consistency rules
- Preserve consistency across all planning docs:
  - If architecture intent changes in `DESIGN.md`, reflect it in `STAGE_TODOS.md` and `EXECUTION_BOARD.md` when applicable.
  - If stream ownership changes, keep acceptance tests and artifact paths aligned in `EXECUTION_BOARD.md`.
- Do not rename core tools or contracts without updating all references.
- Keep interface contract names stable unless intentionally replaced:
  - `RouteSpec`, `ToolSpec`, `MemoryContract`, `TraceSchema`, `PolicySet`.

## Writing and formatting standards
- Prefer concise, explicit Markdown headings.
- Keep checklists actionable and testable.
- Use deterministic language ("must", "required", "blocked unless") for gates and controls.
- Avoid speculative timeline promises; describe technical scope and dependencies instead.

## Git and PR behavior
- Work on the active feature branch unless explicitly instructed otherwise.
- Commit in small, logically grouped units with descriptive commit messages.
- Push after each meaningful iteration with:
  - `git push -u origin <branch-name>`
- If a pull request exists for the branch, update it; otherwise create a draft PR.
- Never force-push unless explicitly requested.

## Validation expectations for this repository
- Since this repo is documentation-first, validation should focus on document integrity:
  - Confirm changed files exist and are readable.
  - Confirm key sections/headings are present.
  - Confirm cross-document references remain accurate after edits.
- When no runnable services are affected, manual UI testing is not required.

## Cursor Cloud specific instructions
- Provide short progress updates while exploring and editing.
- Before ending a task, include:
  - A concise summary of changed files.
  - Exact validation commands run and their outcomes.
  - Any remaining assumptions or risks.
- If a task requires significant local environment bootstrapping repeatedly, propose an environment-setup follow-up prompt for future agents.
