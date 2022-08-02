//Orbstation: random name generation for new species

/proc/vox_name(gender)
	. = ""

	var/new_name = ""
	var/static/list/syllables = list("ti", "ti", "ti", "hi", "hi", "ki", "ki", "ki", "ki", "ya", "ta", "ha", "ka", "ya", "chi", "cha", "kah", \
		"skre", "ahk", "ehk", "rawk", "kra", "ki", "ii", "kri", "ka")
	for(var/x = rand(3,8) to 0 step -1)
		new_name += pick(syllables)
	. += "[capitalize(new_name)]"
