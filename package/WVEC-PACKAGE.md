# WorldVistA Engineering Console (WVEC)

## Package Identity

**Package Name:** WorldVistA Engineering Console

**Namespace:** WVEC*

**Current Version:** 1.0

**Distribution:** KIDS

**Primary Developer:** Allan Steven Finkelstein

---

## Purpose

The WorldVistA Engineering Console (WVEC) provides engineering, diagnostic, development, maintenance, and system analysis tools for WorldVistA systems.

WVEC is intended for system programmers, package developers, maintainers, and advanced administrators.

---

## Design Goals

* Native WorldVistA package
* Distributed through KIDS
* Runs on WorldVistA/YottaDB
* Git-managed source code
* Modular architecture
* Extensible command framework
* Minimal external dependencies

---

## Major Components

* System Status
* Kernel Diagnostics
* TaskMan Diagnostics
* MailMan Diagnostics
* FileMan Diagnostics
* Global Utilities
* Routine Utilities
* KIDS Utilities
* Snapshot and Reporting
* Engineering Dashboard

---

## Development Philosophy

WVEC follows the traditional VistA design philosophy:

* Small routines
* Clearly defined entry points
* Modular services
* Backward compatibility
* Extensive inline documentation
* KIDS-based deployment

Linux shell scripts are used only to bootstrap the environment and launch engineering services. Engineering logic resides within M routines.
