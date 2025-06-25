require("lfs")
DIR_SEP="\\" --should be "/" for Unix platforms (Linux and Mac)
function browseFolder(root)
	for entity in lfs.dir(root) do
		if entity~="." and entity~=".." then
			local fullPath=root..DIR_SEP..entity
			--print("root: "..root..", entity: "..entity..", mode: "..(lfs.attributes(fullPath,"mode")or "-")..", full path: "..fullPath)
			local mode=lfs.attributes(fullPath,"mode")
			if mode=="file" then
				--this is where the processing happens. I print the name of the file and its path but it can be any code
				if string.find(entity, "vtx") and not string.find(entity, "dx90") then
					local newname = string.gsub(entity, ".vtx", ".dx90.vtx")
					--os.execute("ren "..root..DIR_SEP..entity.." "..root..DIR_SEP..newname.."")
					os.rename(root..DIR_SEP..entity, root..DIR_SEP..newname)
					print(root.." > "..entity)
				end
			elseif mode=="directory" then
				browseFolder(fullPath);
			end
		end
	end
end

--this is a sample call
browseFolder(".")