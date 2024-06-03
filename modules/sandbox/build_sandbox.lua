-- SANDBOX
project "Sandbox"
   kind "ConsoleApp"
   files { "**.h", "**.hpp", "**.cpp" }
   includedirs {"./", "../engine/include"}
   links { "PVKEngine" }
   defines { "PVK_IMPORT" }
