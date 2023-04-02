include "../../premake/common_premake_defines.lua"

project "brotli"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	cdialect "C17"
	targetname "%{prj.name}"
	inlining "Auto"

	files {
		"./c/dec/**.h",
		"./c/dec/**.c",
		"./c/enc/**.h",
		"./c/enc/**.c",
		"./c/common/**.h",
		"./c/common/**.c",
		"./c/include/**.h"
	}

	includedirs {
		"%{IncludeDir.brotli}"
	}

	filter "toolset:msc"
		disablewarnings { "4334" }