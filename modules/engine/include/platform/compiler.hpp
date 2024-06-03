#pragma once

#if defined(__clang__)

#    if PVK_EXPORT
#        define PVK_API __attribute__((__visibility__("default")))
#    elif PVK_IMPORT
#        define PVK_API
#    endif

#    define CPP_STANDARD __cplusplus
#    define INLINE inline
#    define FORCE_INLINE inline
#    define FORCE_NOINLINE __attribute__((noinline))
#    define DEPRECATED [[deprecated]]
#    define STATIC_ASSERT _Static_assert

#elif defined(__GNUC__)

#    if PVK_EXPORT
#        define PVK_API __attribute__((__visibility__("default")))
#    elif PVK_IMPORT
#        define PVK_API
#    endif

#    define CPP_STANDARD __cplusplus
#    define INLINE inline
#    define FORCE_INLINE inline
#    define FORCE_NOINLINE __attribute__((noinline))
#    define DEPRECATED [[deprecated]]
#    define STATIC_ASSERT _Static_assert

#elif defined(_MSC_VER)

#    if _MSC_VER < 1920
#        error "Required Visual Studio 2019 (16.0) or newer."
#    endif

#    if PVK_EXPORT
#        define PVK_API __declspec(dllexport)
#    elif PVK_IMPORT
#        define PVK_API __declspec(dllimport)
#    endif

#    define CPP_STANDARD _MSVC_LANG
#    define INLINE __inline
#    define FORCE_INLINE __forceinline
#    define FORCE_NOINLINE __declspec(noinline)
#    define DEPRECATED __declspec(deprecated)
#    define STATIC_ASSERT static_assert

#else

#    error "Unknown compiler."

#endif

// C++ 20
#if CPP_STANDARD < 202002L
#    error "Please compile with c++20"
#endif
