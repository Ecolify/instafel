# Instafel Documentation

This directory contains technical documentation for the Instafel project.

## Available Documents

### [GHOST_VIEWONCE_FIX.md](GHOST_VIEWONCE_FIX.md)
**Technical deep-dive into the Ghost ViewOnce patch fix**

Covers:
- Problem analysis and root cause
- Instagram smali code structure analysis
- InstaEclipse vs Instafel comparison
- Implementation details and filtering strategy
- Files modified and changes made

**Audience:** Developers, maintainers, contributors

### [GHOST_VIEWONCE_TESTING.md](GHOST_VIEWONCE_TESTING.md)
**Testing and validation guide for the Ghost ViewOnce patch**

Covers:
- Build verification steps
- Patch application testing
- Runtime testing procedures
- Validation checklist
- Troubleshooting common issues

**Audience:** Testers, QA, developers

## Quick Reference

### What is Ghost ViewOnce?

Ghost ViewOnce is a feature that allows users to view "view once" messages in Instagram without marking them as "seen" to the sender. The message remains viewable instead of being deleted after first view.

### How does it work?

The patch intercepts the method that sends "visual_item_seen" markers to Instagram servers. When Ghost ViewOnce is enabled, the method returns early without sending the marker, so the sender never knows the message was viewed.

### Key Files

**Patch Implementation:**
- `patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/GhostViewOnce.kt`

**Search Utilities:**
- `patcher-core/src/main/kotlin/instafel/patcher/core/utils/SearchUtils.kt`
- `patcher-core/src/main/kotlin/instafel/patcher/core/utils/modals/FileSearchResult.kt`

**Target Instagram File:**
- `instagram/smali/X/5nc.smali` (in decompiled Instagram APK)

**Reference Implementation:**
- `instaeclipse/app/src/main/java/ps/reso/instaeclipse/mods/ghost/ViewOnce.java`

## Contributing

When contributing to the Ghost ViewOnce patch or related functionality:

1. Read `GHOST_VIEWONCE_FIX.md` to understand the implementation
2. Follow the testing procedures in `GHOST_VIEWONCE_TESTING.md`
3. Ensure all validation checks pass
4. Update documentation if behavior changes

## Future Documentation

Planned documentation to be added:

- [ ] Other Ghost Mode patches (Ghost Story, Ghost Typing, etc.)
- [ ] General patching guidelines
- [ ] Architecture overview
- [ ] Contributing guide
- [ ] Version compatibility matrix
