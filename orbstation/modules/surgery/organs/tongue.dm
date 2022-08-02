//Tongues for Orbstation species

/obj/item/organ/internal/tongue/vox
	name = "hindtongue"
	desc = "Some kind of severed bird tongue."
	var/static/list/languages_possible_vox = typecacheof(list(
		/datum/language/common,
		/datum/language/uncommon,
		/datum/language/draconic,
		/datum/language/codespeak,
		/datum/language/monkey,
		/datum/language/narsie,
		/datum/language/beachbum,
		/datum/language/aphasia,
		/datum/language/piratespeak,
		/datum/language/moffic,
		/datum/language/sylvan,
		/datum/language/shadowtongue,
		/datum/language/terrum,
		/datum/language/nekomimetic,
		/datum/language/vox_pidgin
	))

/obj/item/organ/internal/tongue/vox/Initialize(mapload)
	. = ..()
	languages_possible = languages_possible_vox
