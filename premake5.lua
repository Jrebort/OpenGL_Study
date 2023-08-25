-- premake5.lua
workspace "OpenGL"
architecture "x64"
configurations { "Debug", "Release" }
startproject "Learning"

   
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "vendor/glfw/include"
IncludeDir["GLEW"] = "vendor/glew/include"

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
        "src",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.GLEW}"
   }

   links {
        "GLFW",
        "opengl32.lib",
        "vendor/glew/lib/Release/x64/glew32s.lib",
        "vendor/glew/lib/Release/x64/glew32.lib"
   }

   filter "configurations:Debug"
        defines {"GLEW_STATIC"}
        --symbols "On"

   filter "configurations:Release"
        defines {"GLEW_STATIC" }
        optimize "On"