# WorldVistA Engineering Console (WVEC)

# Engineering Principles

**Author:** Allan Steven Finkelstein

**Version:** 1.0

---

# Introduction

The WorldVistA Engineering Console (WVEC) is more than a collection of utilities. It is intended to embody the engineering philosophy that made VistA successful: simplicity, modularity, reliability, and maintainability.

These principles guide every design decision made within the WVEC project.

---

# 1. Simplicity

Prefer simple solutions over clever solutions.

Small routines are easier to understand, easier to test, and easier to maintain than large, complex routines.

Every routine should have a clearly defined purpose.

---

# 2. Modularity

Each routine should provide a single engineering service.

Examples:

* `WVECSTAT` — Status services
* `WVECKERN` — Kernel diagnostics
* `WVECTSK` — TaskMan services
* `WVECMAIL` — MailMan services

Routines communicate through well-defined entry points rather than internal implementation details.

---

# 3. Stable Public APIs

Public entry points become contracts.

Applications should depend only on documented APIs.

Internal implementations may evolve without affecting callers.

---

# 4. Build Everything from Source

Git is the authoritative source repository.

Generated artifacts are disposable.

Every release must be reproducible from source.

---

# 5. KIDS Is the Distribution Mechanism

WVEC is distributed as a standard VistA package.

Deployment should never depend on manual copying of routines.

Every release should be installable through KIDS.

---

# 6. Automation Before Repetition

Any engineering task performed repeatedly should eventually become automated.

Examples include:

* Routine deployment
* Source validation
* Smoke testing
* Package generation
* Release packaging

Automation reduces errors and improves consistency.

---

# 7. Diagnostics Before Repair

Engineering begins with understanding.

WVEC should first determine system state before attempting corrective actions.

Every diagnostic should explain what was tested and what the result means.

---

# 8. Readability Over Cleverness

Code is read more often than it is written.

Prefer descriptive names, straightforward logic, and clear comments over compact or obscure techniques.

Future maintainers should be able to understand the code without extensive reverse engineering.

---

# 9. Backward Compatibility

Changes should preserve existing public interfaces whenever practical.

Breaking changes require clear justification and appropriate versioning.

---

# 10. Incremental Development

Develop in small, testable increments.

Each change should:

* Compile successfully.
* Pass smoke tests.
* Be committed to Git.
* Be understandable in isolation.

Large, unreviewed changes increase project risk.

---

# 11. Documentation Is Part of the Product

Documentation is maintained alongside the source code.

Architectural decisions, APIs, and operational procedures should be documented as the project evolves.

Documentation should describe both the intended design and significant implementation decisions.

---

# 12. Engineering Workflow

Every feature follows the same lifecycle:

1. Design
2. Implement
3. Review
4. Test
5. Commit
6. Package
7. Release

This repeatable workflow promotes quality, traceability, and maintainability.

---

# 13. Respect the VistA Architecture

WVEC extends WorldVistA; it does not replace it.

Whenever possible, use existing Kernel, FileMan, MailMan, and TaskMan services rather than duplicating functionality.

Integration is preferred over reinvention.

---

# 14. Long-Term Stewardship

WVEC should remain maintainable over decades.

Design decisions should favor clarity, portability, extensibility, and careful documentation so that future developers can understand, maintain, and improve the package with confidence.

The measure of success is not only that the package works today, but that it remains useful and understandable for future generations of WorldVistA developers.
