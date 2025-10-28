# Instafel Documentation

This directory contains technical documentation for the Instafel project.

## Available Documents

### [NETWORK_INTERCEPTOR_USAGE.md](NETWORK_INTERCEPTOR_USAGE.md)
**User guide for Network Interceptor ghost mode feature**

Covers:
- How to enable and use ghost mode
- What gets blocked and why
- Verification and testing procedures
- Troubleshooting common issues
- Best practices and FAQ

**Audience:** End users, testers

### [NETWORK_INTERCEPTOR.md](NETWORK_INTERCEPTOR.md)
**Implementation of network-level ghost mode interception**

Covers:
- InstaEclipse Interceptor.java reference implementation
- Reflection-based URI interception approach
- TigonServiceLayer.startRequest hooking
- Smali patching vs Xposed comparison
- Architecture and integration details
- Testing and troubleshooting guide

**Audience:** Developers, maintainers, contributors

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

**Network Interceptor:**
- `app/src/main/java/instafel/app/utils/ghost/NetworkInterceptor.java`
- `patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/NetworkInterceptor.kt`

**Ghost ViewOnce Patch:**
- `patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/GhostViewOnce.kt`

**Other Ghost Patches:**
- `patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/GhostSeen.kt`
- `patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/GhostTyping.kt`
- `patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/GhostScreenshot.kt`
- `patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/GhostStory.kt`
- `patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/GhostLive.kt`
- `patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/GhostMode.kt`

**Ghost Mode Manager:**
- `app/src/main/java/instafel/app/utils/ghost/GhostModeManager.java`

**Search Utilities:**
- `patcher-core/src/main/kotlin/instafel/patcher/core/utils/SearchUtils.kt`
- `patcher-core/src/main/kotlin/instafel/patcher/core/utils/modals/FileSearchResult.kt`

**Target Instagram Files:**
- Various smali files in `instagram/smali/` (in decompiled Instagram APK)

**Reference Implementation:**
- `instaeclipse/app/src/main/java/ps/reso/instaeclipse/mods/network/Interceptor.java`
- `instaeclipse/app/src/main/java/ps/reso/instaeclipse/mods/ghost/ViewOnce.java`
- Other InstaEclipse ghost mode modules

## Contributing

When contributing to the Ghost ViewOnce patch or related functionality:

1. Read `GHOST_VIEWONCE_FIX.md` to understand the implementation
2. Follow the testing procedures in `GHOST_VIEWONCE_TESTING.md`
3. Ensure all validation checks pass
4. Update documentation if behavior changes

## Future Documentation

Planned documentation to be added:

- [x] Network Interceptor implementation (NETWORK_INTERCEPTOR.md)
- [ ] Other Ghost Mode patches architecture overview
- [ ] General patching guidelines
- [ ] Architecture overview
- [ ] Contributing guide
- [ ] Version compatibility matrix
