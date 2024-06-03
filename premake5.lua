-- Command Line Options:
newoption {
   trigger     = "with-engine",
   description = "Build the Engine module"
}

newoption {
   trigger     = "with-editor",
   description = "Build the Editor module"
}

newoption {
   trigger     = "with-sandbox",
   description = "Build the Sandbox module"
}

-- Common Project Settings
workspace "PVKEngine"
   targetdir "bin/%{prj.name}/%{cfg.system}/%{cfg.buildcfg}"
   objdir "bin/%{prj.name}/%{cfg.system}/%{cfg.buildcfg}/intermediate"
   configurations { "Debug", "Development", "Shipping" }
   platforms { "x64" }
   startproject "Sandbox"
   language "C++"
   cppdialect "C++20"
   cdialect "C17"
   systemversion "latest"
   architecture "x86_64"
   characterset "Unicode"
   floatingpoint "Fast"
   warnings "Extra"
   externalwarnings "Extra"
   flags { "FatalWarnings" }
   staticruntime "off"

-- DEBUG
   filter "configurations:Debug"
      defines { "_DEBUG", "PVK_DEBUG" }
      optimize "Off"
      runtime "Debug"
      symbols "On"

-- DEVELOPMENT
   filter "configurations:Development"
      defines { "_DEBUG", "PVK_DEVELOPMENT" }
      optimize "Debug"
      runtime "Debug"
      symbols "On"

-- SHIPPING
   filter "configurations:Shipping"
      defines { "NDEBUG", "PVK_SHIPPING" }
      flags {"LinkTimeOptimization"}
      optimize "Full"
      runtime "Release"
      symbols "Off"

-- Windows
   filter "system:windows"
      defines { "_CRT_SECURE_NO_WARNINGS", "_WINDOWS", "WIN32_LEAN_AND_MEAN" }
      buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus" }
      toolset "msc"

-- Linux      
   filter "system:linux"
      toolset "clang"

-- COMMAND LINE BUILD SELECTION
-- Include Engine project if selected
if _OPTIONS["with-engine"] then
   include "modules/engine/build_engine.lua"
end

-- Include Editor project if selected
if _OPTIONS["with-editor"] then
   include "modules/editor/build_editor.lua"
end

-- Include Sandbox project if selected
if _OPTIONS["with-sandbox"] then
   include "modules/sandbox/build_sandbox.lua"
end
