/datum/preference/choiced/tail_vox
	savefile_key = "feature_vox_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	can_randomize = FALSE
	relevant_external_organ = /obj/item/organ/external/tail/vox

/datum/preference/choiced/tail_vox/init_possible_values()
	return assoc_to_keys(GLOB.tails_list_vox)

/datum/preference/choiced/tail_vox/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tail_vox"] = value

/datum/preference/choiced/tail_vox/create_default_value()
	var/datum/sprite_accessory/tails/vox/vox/tail = /datum/sprite_accessory/tails/vox/vox
	return initial(tail.name)

/datum/preference/choiced/vox_head_quills
	savefile_key = "feature_vox_head_quills"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Vox head quills"
	should_generate_icons = TRUE

/datum/preference/choiced/vox_head_quills/init_possible_values()
	var/list/values = list()

	var/icon/vox_head = icon('orbstation/icons/mob/species/vox/bodyparts.dmi', "vox_head")
	vox_head.Blend(icon('orbstation/icons/mob/species/vox/vox_parts.dmi', "eyes"), ICON_OVERLAY)

	for (var/quills_name in GLOB.vox_head_quills_list)
		var/datum/sprite_accessory/quills = GLOB.vox_head_quills_list[quills_name]

		var/icon/icon_with_quills = new(vox_head)
		icon_with_quills.Blend(icon(quills.icon, "m_vox_head_quills_[quills.icon_state]_ADJ"), ICON_OVERLAY)
		icon_with_quills.Scale(64, 64)
		icon_with_quills.Crop(15, 64, 15 + 31, 64 - 31)

		values[quills.name] = icon_with_quills

	return values

/datum/preference/choiced/vox_head_quills/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["vox_head_quills"] = value

/datum/preference/choiced/vox_neck_quills
	savefile_key = "feature_vox_neck_quills"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Vox neck quills"
	should_generate_icons = TRUE

/datum/preference/choiced/vox_neck_quills/init_possible_values()
	var/list/values = list()

	var/icon/vox_head = icon('orbstation/icons/mob/species/vox/bodyparts.dmi', "vox_head")
	vox_head.Blend(icon('orbstation/icons/mob/species/vox/vox_parts.dmi', "eyes"), ICON_OVERLAY)

	for (var/quills_name in GLOB.vox_neck_quills_list)
		var/datum/sprite_accessory/quills = GLOB.vox_neck_quills_list[quills_name]

		var/icon/icon_with_quills = new(vox_head)
		icon_with_quills.Blend(icon(quills.icon, "m_vox_neck_quills_[quills.icon_state]_ADJ"), ICON_OVERLAY)
		icon_with_quills.Scale(64, 64)
		icon_with_quills.Crop(15, 64, 15 + 31, 64 - 31)

		values[quills.name] = icon_with_quills

	return values

/datum/preference/choiced/vox_neck_quills/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["vox_neck_quills"] = value
