/datum/species/vox
	// Giant bird lizards.
	name = "\improper Vox"
	plural_form = "Vox"
	id = SPECIES_VOX
	say_mod = "shrieks"
	species_traits = list(MUTCOLORS, EYECOLOR, HAS_FLESH, HAS_BONE, NO_UNDERWEAR)
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_CAN_USE_FLIGHT_POTION,
		TRAIT_LITERATE,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_REPTILE
	mutant_bodyparts = list("body_markings" = "None")
	external_organs = list(
		///obj/item/organ/external/vox_head_frills = "None",
		///obj/item/organ/external/vox_neck_frills = "None",
	)
	mutanttongue = /obj/item/organ/internal/tongue/vox
	//coldmod = 0.67
	//heatmod = 1.5
	payday_modifier = 1.0
	punchdamagelow = 6
	punchdamagehigh = 12
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_cookie = /obj/item/food/meat/slab
	attack_verb = "slash"
	attack_effect = ATTACK_EFFECT_CLAW
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	meat = /obj/item/food/meat/slab/chicken
	disliked_food = GRAIN
	liked_food = MEAT | NUTS | BUGS
	//deathsound = 'sound/voice/lizard/deathsound.ogg'
	wings_icons = list("Angel")
	species_language_holder = /datum/language_holder/vox

	ass_image = 'icons/ass/asslizard.png'

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/vox,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/vox,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/vox,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/vox,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/vox,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/vox,
	)

/datum/species/vox/random_name(gender,unique,lastname)
	if(unique)
		return random_unique_vox_name(gender)

	var/randname = vox_name(gender)

	if(lastname)
		randname += " [lastname]"

	return randname

/datum/species/vox/randomize_main_appearance_element(mob/living/carbon/human/human_mob)
	var/tail = pick(GLOB.tails_list_lizard)
	human_mob.dna.features["tail_lizard"] = tail
	mutant_bodyparts["tail_lizard"] = tail
	human_mob.update_body()

/datum/species/vox/get_scream_sound(mob/living/carbon/human/vox)
	return pick(
		'sound/voice/lizard/lizard_scream_1.ogg',
		'sound/voice/lizard/lizard_scream_2.ogg',
		'sound/voice/lizard/lizard_scream_3.ogg',
	)

/datum/species/vox/get_species_description()
	return "Vox description here."

/datum/species/vox/get_species_lore()
	return list(
		"Vox lore here."
	)
