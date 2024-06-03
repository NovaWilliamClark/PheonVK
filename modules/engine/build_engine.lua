-- ENGINE
project "PVKEngine"
   kind "SharedLib"   
   files { "**.h", "**.hpp", "**.cpp" }
   includedirs {"./include"}
   defines { "PVK_EXPORT" }
   pic "On"

   filter "system:windows"
      includedirs { "$(VULKAN_SDK)/include" }
      links {"$(VULKAN_SDK)/lib/vulkan-1.lib"}
      
   filter "system:linux"
      links { "vulkan" }
