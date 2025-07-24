![image1](powershell.jpg)

# ISSUES and Practical Improvement Tips for GenXdev.Windows

---

## Module Critique

**Strengths:**
- Good use of comment-based help and parameter documentation.
- Consistent use of verbose output for diagnostics.
- Follows PowerShell advanced function patterns and uses .NET interop for window management.
- Aliases are present and not excessive.

**Areas for Improvement:**
- Some parameter blocks lack strict 80-char separator lines and meta sections.
- Parameter attribute alignment and block separation can be improved for clarity.
- Some code lines and comments exceed 80 characters.
- Not all code lines are wrapped after pipeline `|` or backtick `\`` as required.
- Some code comments are missing or not sufficiently explanatory for non-trivial logic.
- The function could benefit from more granular error handling and user feedback.
- Use of `[System.IO]` routines is not visible, but ensure to use `GenXdev.FileSystem\Expand-Path` for path expansion if needed.
- Ensure all function and parameter blocks are separated by exactly one 80-char line of `#`.
- Ensure all help and code lines are wrapped to 80 characters.
- Add empty lines after opening curly braces `{` and before code, but not before closing `}`.
- Ensure all code comments are above the code they reference, with no empty line between comment and code.
- Add more verbose output for user-facing actions.

---

## Practical Tips for Improvement

1. **Separator Lines & Meta Sections:**
   - Add or correct 80-char `#` lines before each parameter and function block.
   - Ensure a `<# #>` meta section with SYNOPSIS, DESCRIPTION, .PARAMETER, and .EXAMPLE is present and wrapped to 80 chars.
2. **Parameter Formatting:**
   - Align all parameter attributes vertically, each on its own line.
   - Add `Position` attributes where appropriate (never for switches).
   - Ensure switch parameters are last and have no position.
   - Use `[Alias()]` only if required by user or called function.
3. **Code Comments:**
   - Add plain-English comments above all non-trivial code lines, following 'Code Complete 2nd Edition' guidelines.
   - Ensure comments alone tell the story of the function.
4. **Code Wrapping:**
   - Wrap all code and help lines to 80 characters.
   - Use parenthesis for wrapped strings.
   - Add newlines after `|` and after parameter backticks, but not for dot or string concat.
5. **Block Formatting:**
   - Add exactly one empty line after each opening `{` and before code.
   - Never add empty lines before closing `}`.
   - Never place empty lines between a comment and its code.
   - Add at least one empty line between code lines or code and preceding comment.
6. **Error Handling:**
   - Add more granular try/catch blocks and user feedback for failures.
7. **Verbose Output:**
   - Use `Write-Verbose` for all major actions and decisions.
8. **ParameterSetName & Positional Attributes:**
   - If no paramsets or positions are used but would help, add them (except for switches).
9. **General:**
   - Ensure all parameter and function names use correct casing.
   - Use `[GenXdev.FileSystem\Expand-Path]` for path expansion, not `[System.IO.Path]::GetFullPath`.
   - Never use `| Out-Null` except when adding to an ArrayList; prefer `$null = ...` otherwise.

---

## Checklist for Refactoring `$CmdletName` in `$ScriptFileName`

1. [ ] No alias definitions changed or removed
2. [ ] Coding bugs, technical debt, and spelling errors checked
3. [ ] Paramsetnames/positional attributes added if beneficial
4. [ ] File starts/ends with 80-char `#` line
5. [ ] 80-char `#` line before each parameter and function
6. [ ] Meta section with SYNOPSIS, DESCRIPTION, .PARAMETER, .EXAMPLE
7. [ ] Unnecessary `| Out-Null` removed, `$null = ...` used
8. [ ] Parameter block formatting and alignment enforced
9. [ ] begin/process/end blocks present
10. [ ] Code comments above all non-trivial code
11. [ ] Comments alone explain function logic
12. [ ] Latest best practices used
13. [ ] Code-smell issues fixed
14. [ ] `Write-Verbose` for essential info
15. [ ] Empty line after `{` before code, none before `}`
16. [ ] No empty line between comment and code
17. [ ] At least one empty line between code lines/comments
18. [ ] No parameter/attribute changes that break dependencies
19. [ ] Parameter attributes applied as needed
20. [ ] Use `GenXdev.FileSystem\Expand-Path` for paths
21. [ ] Uppercase for parameters, lowercase for internals
22. [ ] Newlines after `|` and parameter backticks
23. [ ] All lines wrapped to 80 chars

---

## Summary of Major Changes Needed
- Enforce strict formatting and separator lines
- Improve parameter and block alignment
- Add/expand code comments for clarity
- Add/expand verbose output
- Ensure all code and help lines are wrapped to 80 chars
- Add error handling and user feedback

---

*This file is auto-generated and will be overwritten on next critique.*
