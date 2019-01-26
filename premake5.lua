solution "gMad"
	configurations { "Debug", "Release" }
	platforms { "x32", "x64" }

	language		"C++"
	characterset	"MBCS"
	location		"project"
	targetdir		"bin"

	filter "platforms:x32"
		architecture "x32"

	filter "platforms:x64"
		architecture "x64"

	if os.host(  ) == "linux" or os.host(  ) == "macosx" then
		buildoptions { "-fPIC" }
		linkoptions  { "-fPIC" }
	end
	
	if os.host(  ) == "linux" then
		links { "pthread" }
	end

	project "gMad"
		kind	"ConsoleApp"
		targetname "gMad"
		symbols "On"
		editandcontinue "Off"
		staticruntime "On"
		vectorextensions "SSE"
		links "bootil_static"
		includedirs "bootil/include"

        if os.host(  ) == "linux" then
                buildoptions { "-fPIC", "-pthread" }
                linkoptions { "-pthread" }
        end

		if os.host(  ) == "linux" then
			targetname( "gMad_linux" )
		end
		
		if os.host(  ) == "macosx" then
			targetname( "gMad_osx" )
		end

		files { "src/**.*", "include/**.*" }

	include "bootil/projects/bootil_premake5.lua"