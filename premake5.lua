-- premake5.lua
workspace "OpenGL"
architecture "x64"
configurations { "Debug", "Release" }
startproject "Learning"

   
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "vendor/glfw/include"

include "vendor/glfw"

project "Learning"
   kind "ConsoleApp"
   language "C++"
   targetdir "bin/%{cfg.buildcfg}"

   files { 
        "src/**.cpp",
        "src/**.h",
    }

   includedirs {
       "%{IncludeDir.GLFW}"
   }

   links {
       "GLFW",
       "opengl32.lib"
   }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"