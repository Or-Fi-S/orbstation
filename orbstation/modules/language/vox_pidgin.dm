/datum/language/vox_pidgin
	name = "Vox Pidgin"
	//copy-pasted from Shiptest, which is copy-pasted from Bay. we may change up the lore as we please.
	desc = "The common tongue of the various Vox ships making up the Shoal. It sounds like chaotic shrieking to everyone else."
	key = "s" //the S is for Shrieks
	flags = TONGUELESS_SPEECH
	space_chance = 20
	syllables = list(
		"ti", "ti", "ti", "hi", "hi", "ki", "ki", "ki", "ki", "ya", "ta", "ha", "ka", "ya", "chi", "cha", "kah",
		"SKRE", "AHK", "EHK", "RAWK", "KRA", "AAA", "EEE", "KI", "II", "KRI", "KA"
	)
	icon = 'orbstation/icons/misc/language.dmi'
	icon_state = "bird"
	default_priority = 90
