#pragma once

#if defined(__clang__)

#    if PVKEXPORT
#        define PVK_API __attribute__((__visibility__("default")))
#    else
#        define PVK_API
#    endif

#    define INLINE inline
#    define FORCE_INLINE inline
#    define FORCE_NOINLINE __attribute__((noinline))
#    define DEPRECATED [[deprecated]]
#    define STATIC_ASSERT _Static_assert

#elif defined(__GNUC__)

#    if PVKEXPORT
#        define PVK_API __attribute__((__visibility__("default")))
#    else
#        define PVK_API
#    endif

#    define INLINE inline
#    define FORCE_INLINE inline
#    define FORCE_NOINLINE __attribute__((noinline))
#    define DEPRECATED [[deprecated]]
#    define STATIC_ASSERT _Static_assert

#elif defined(_MSC_VER)

#    if _MSC_VER < 1920
#        error "Required Visual Studio 2019 (16.0) or newer."
#    endif

#    if PVKEXPORT
#        define PVK_API __declspec(dllexport)
#    else
#        define PVK_API __declspec(dllimport)
#    endif

#    define INLINE __inline
#    define FORCE_INLINE __forceinline
#    define FORCE_NOINLINE __declspec(noinline)
#    define DEPRECATED __declspec(deprecated)
#    define STATIC_ASSERT static_assert

#else

#    error "Unknown compiler."

#endif

// C++ 20
#if __cplusplus < 202002L
#    error "Please compile with c++20"
#endif
