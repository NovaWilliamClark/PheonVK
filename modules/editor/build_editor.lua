-- EDITOR
project "Editor"
   kind "ConsoleApp"
   files { "**.h", "**.hpp", "**.cpp" }
   includedirs {"./include", "../engine/include"}
   links { "PVKEngine" }
   defines { "PVK_IMPORT" }
