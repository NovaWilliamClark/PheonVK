#pragma once
#include "compiler.hpp"

// Unsigned int
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int uint32;
typedef unsigned long long uint64;

// Signed int
typedef signed char int8;
typedef signed short int16;
typedef signed int int32;
typedef signed long long int64;

// Floating Point types
typedef float float32;
typedef double float64;

typedef char bool8;

// Static assertions for unsigned integers
STATIC_ASSERT(sizeof(uint8) == 1, "uint8 should be 1 byte");
STATIC_ASSERT(sizeof(uint16) == 2, "uint16 should be 2 bytes");
STATIC_ASSERT(sizeof(uint32) == 4, "uint32 should be 4 bytes");
STATIC_ASSERT(sizeof(uint64) == 8, "uint64 should be 8 bytes");

// Static assertions for signed integers
STATIC_ASSERT(sizeof(int8) == 1, "int8 should be 1 byte");
STATIC_ASSERT(sizeof(int16) == 2, "int16 should be 2 bytes");
STATIC_ASSERT(sizeof(int32) == 4, "int32 should be 4 bytes");
STATIC_ASSERT(sizeof(int64) == 8, "int64 should be 8 bytes");

// Static assertions for floating point types
STATIC_ASSERT(sizeof(float32) == 4, "float32 should be 4 bytes");
STATIC_ASSERT(sizeof(float64) == 8, "float64 should be 8 bytes");

// Static assertion for boolean type
STATIC_ASSERT(sizeof(bool8) == 1, "bool8 should be 1 byte");
