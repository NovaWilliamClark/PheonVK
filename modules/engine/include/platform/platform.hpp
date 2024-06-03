#pragma once

// Platform Validation Layer
// This header file checks the compilation environment to ensure the software builds only on supported platforms.
// It defines macros based on the detected environment:
// - PVK_PLATFORM_WINDOWS for Windows 64-bit.
// - PVK_PLATFORM_LINUX for Linux x86_64.
// The code blocks 32-bit Windows, all ARM architectures, and Mac/iOS platforms, displaying an error if attempted.
// An error is also raised if the platform is neither Windows 64-bit nor Linux x86_64, ensuring correct
// platform-specific compilation.

// Check for Windows 64-bit
#if defined(_WIN32) || defined(_WIN64)
#    if defined(_WIN64)
#        define PVK_PLATFORM_WINDOWS
#    else
#        error "32-bit Windows is not supported."
#    endif
#endif

// Check for Linux x86_64
#if defined(__linux__)
#    if defined(__x86_64__) || defined(_M_X64)
#        define PVK_PLATFORM_LINUX
#    else
#        error "Only x86_64 architecture is supported on Linux."
#    endif
#endif

// Exclude ARM processors
#if defined(__arm__) || defined(__aarch64__) || defined(_M_ARM) || defined(_M_ARMT)
#    error "ARM processors are not supported."
#endif

// Exclude Mac/iOS
#if defined(__APPLE__) || defined(__MACH__)
#    error "Mac/iOS are not supported."
#endif

// Check for unsupported platforms
#if !defined(PVK_PLATFORM_WINDOWS) && !defined(PVK_PLATFORM_LINUX)
#    error "Unsupported platform. Only Windows 64-bit and Linux x86_64 are supported."
#endif
