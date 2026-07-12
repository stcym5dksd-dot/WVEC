# WorldVistA Engineering Console (WVEC)

## Software Architecture Document

**Document Version:** 1.0
**Package Version:** WVEC 1.0
**Author:** Allan Steven Finkelstein

---

# 1. Executive Summary

The WorldVistA Engineering Console (WVEC) is a native WorldVistA engineering package that provides diagnostic, maintenance, development, and system analysis capabilities for WorldVistA running on YottaDB.

WVEC is designed to become the primary engineering toolkit for developers, maintainers, and advanced administrators. The package follows established VistA design principles while incorporating modern development practices including Git source control, automated builds, validation, and repeatable testing.

---

# 2. Objectives

The primary objectives of WVEC are:

* Provide a unified engineering environment.
* Deliver comprehensive system diagnostics.
* Support routine and global analysis.
* Simplify package development.
* Automate repetitive engineering tasks.
* Distribute through standard KIDS builds.
* Preserve compatibility with existing WorldVistA systems.

---

# 3. High-Level Architecture

```
                 Linux / WSL
                      │
                 ./bin/wvec
                      │
          Environment Bootstrap
                      │
                 Start YottaDB
                      │
                WorldVistA Runtime
                      │
              ┌───────┴────────┐
              │                │
         WVEC Package      Existing Packages
              │
    ┌─────────┼──────────────────────────────┐
    │         │         │         │          │
 STATUS    Kernel    TaskMan   MailMan   FileMan
```

The Linux layer is responsible for launching and deployment only.

Engineering functionality resides within native M routines.

---

# 4. Package Organization

Routine namespace:

* WVEC
* WVECSTAT
* WVECKERN
* WVECTSK
* WVECMAIL
* WVECFM
* WVECGLOB
* WVECRTNS
* WVECKIDS
* WVECUTIL

Each routine provides a focused service with well-defined public entry points.

---

# 5. Repository Layout

```
wvec/
├── bin/
├── config/
├── docs/
├── lib/
├── package/
├── src/
│   ├── routines/
│   ├── kids/
│   └── install/
├── tests/
└── logs/
```

The Git repository is the authoritative source for all code and documentation.

---

# 6. Development Workflow

Every change follows this sequence:

1. Edit source in `src/routines`
2. Commit to Git
3. Run `wvec-build`
4. Deploy to the development environment
5. Execute smoke tests
6. Package with KIDS
7. Tag release

This ensures that every release is reproducible.

---

# 7. Public API

Initial public entry points include:

* `ABOUT^WVEC`
* `VERSION^WVEC()`
* `STATUS^WVEC`
* `STATUS^WVECSTAT`

Additional services will be added while preserving backward compatibility.

---

# 8. Coding Standards

Every routine shall:

* Use the `WVEC` namespace.
* Include a descriptive routine header.
* Document all public entry points.
* Minimize dependencies.
* Remain modular and readable.
* Favor clear interfaces over complex implementations.

---

# 9. Build System

The build utility is responsible for:

* Validating source routines.
* Detecting invalid content.
* Deploying routines into the development environment.
* Supporting future automated testing.
* Preparing for KIDS package generation.

---

# 10. Testing Strategy

Testing consists of:

* Source validation.
* Build validation.
* Smoke tests.
* Functional tests.
* Regression testing before release.

Every feature should be testable independently.

---

# 11. Distribution Strategy

WVEC will be distributed as a standard KIDS package.

Target package identifier:

`WVEC*1.0*1`

Git remains the development repository; KIDS remains the installation mechanism.

---

# 12. Roadmap

## Phase 1 – Foundation

* Package framework
* Build utility
* Status services
* Documentation

## Phase 2 – Engineering Services

* Kernel diagnostics
* TaskMan diagnostics
* MailMan diagnostics
* FileMan diagnostics

## Phase 3 – Advanced Tools

* Global Explorer
* Routine Explorer
* Snapshot Manager
* Package analysis

## Phase 4 – Distribution

* Automated KIDS generation
* Release automation
* Developer documentation
* Community distribution

---

# 13. Guiding Principle

WVEC extends WorldVistA by providing modern engineering tools while remaining faithful to the modular architecture, stability, and maintainability that have characterized VistA for decades.

The package is intended to serve as a long-term engineering platform for WorldVistA developers and system maintainers.
