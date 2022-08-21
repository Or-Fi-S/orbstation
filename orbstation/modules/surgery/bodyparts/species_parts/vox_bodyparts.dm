/obj/item/bodypart/head/vox
	icon_static = 'orbstation/icons/mob/species/vox/bodyparts.dmi'
	limb_id = SPECIES_VOX
	uses_mutcolor = TRUE
	is_dimorphic = FALSE
	bodytype = BODYTYPE_VOX | BODYTYPE_ORGANIC
	should_draw_greyscale = FALSE

/obj/item/bodypart/head/vox/get_limb_icon(dropped)
	//SHOULD_CALL_PARENT(TRUE)
	RETURN_TYPE(/list)

	icon_state = "" //to erase the default sprite, we're building the visual aspects of the bodypart through overlays alone.

	. = list()

	var/image_dir = 0
	if(dropped)
		image_dir = SOUTH
		if(dmg_overlay_type)
			if(brutestate)
				. += image('icons/mob/dam_mob.dmi', "[dmg_overlay_type]_[body_zone]_[brutestate]0", -DAMAGE_LAYER, image_dir)
			if(burnstate)
				. += image('icons/mob/dam_mob.dmi', "[dmg_overlay_type]_[body_zone]_0[burnstate]", -DAMAGE_LAYER, image_dir)

	var/image/limb = image(layer = -BODY_ADJ_LAYER, dir = image_dir)
	var/image/aux



	if(animal_origin)
		if(IS_ORGANIC_LIMB(src))
			limb.icon = 'icons/mob/animal_parts.dmi'
			if(limb_id == "husk")
				limb.icon_state = "[animal_origin]_husk_[body_zone]"
			else
				limb.icon_state = "[animal_origin]_[body_zone]"
		else
			limb.icon = 'icons/mob/augmentation/augments.dmi'
			limb.icon_state = "[animal_origin]_[body_zone]"

		if(blocks_emissive)
			var/mutable_appearance/limb_em_block = emissive_blocker(limb.icon, limb.icon_state, alpha = limb.alpha)
			limb_em_block.dir = image_dir
			limb.overlays += limb_em_block
		. += limb
		return

	//HUSK SHIIIIT
	if(is_husked)
		limb.icon = icon_husk
		limb.icon_state = "[husk_type]_husk_[body_zone]"
		icon_exists(limb.icon, limb.icon_state, scream = TRUE) //Prints a stack trace on the first failure of a given iconstate.
		. += limb
		if(aux_zone) //Hand shit
			aux = image(limb.icon, "[husk_type]_husk_[aux_zone]", -aux_layer, image_dir)
			. += aux
		return .
	//END HUSK SHIIIIT

	////This is the MEAT of limb icon code
	limb.icon = icon_greyscale
	if(!should_draw_greyscale || !icon_greyscale)
		limb.icon = icon_static

	if(is_dimorphic) //Does this type of limb have sexual dimorphism?
		limb.icon_state = "[limb_id]_[body_zone]_[limb_gender]"
	else
		limb.icon_state = "[limb_id]_[body_zone]"

	icon_exists(limb.icon, limb.icon_state, TRUE) //Prints a stack trace on the first failure of a given iconstate.

	if(body_zone == BODY_ZONE_R_LEG)
		var/obj/item/bodypart/r_leg/leg = src
		var/limb_overlays = limb.overlays
		var/image/new_limb = leg.generate_masked_right_leg(limb.icon, limb.icon_state, image_dir)
		if(new_limb)
			limb = new_limb
			limb.overlays = limb_overlays

	. += limb

	if(aux_zone) //Hand shit
		aux = image(limb.icon, "[limb_id]_[aux_zone]", -aux_layer, image_dir)
		. += aux

	draw_color = mutation_color
	if(should_draw_greyscale) //Should the limb be colored outside of a forced color?
		draw_color ||= (species_color) || (skin_tone && skintone2hex(skin_tone))

	if(draw_color)
		limb.color = "[draw_color]"
		if(aux_zone)
			aux.color = "[draw_color]"

	//EMISSIVE CODE START
	if(blocks_emissive)
		var/mutable_appearance/limb_em_block = emissive_blocker(limb.icon, limb.icon_state, alpha = limb.alpha)
		limb_em_block.dir = image_dir
		limb.overlays += limb_em_block

		if(aux_zone)
			var/mutable_appearance/aux_em_block = emissive_blocker(aux.icon, aux.icon_state, alpha = aux.alpha)
			aux_em_block.dir = image_dir
			aux.overlays += aux_em_block

	//EMISSIVE CODE END
	//Draw external organs like horns and frills
	for(var/obj/item/organ/external/external_organ as anything in external_organs)
		if(!dropped && !external_organ.can_draw_on_bodypart(owner))
			continue
		//Some externals have multiple layers for background, foreground and between
		for(var/external_layer in external_organ.all_layers)
			if(external_organ.layers & external_layer)
				external_organ.get_overlays(
					.,
					image_dir,
					external_organ.bitflag_to_layer(external_layer),
					limb_gender,
				)

/obj/item/bodypart/chest/vox
	icon_static = 'orbstation/icons/mob/species/vox/bodyparts.dmi'
	uses_mutcolor = TRUE
	limb_id = SPECIES_VOX
	is_dimorphic = FALSE
	bodytype = BODYTYPE_VOX | BODYTYPE_ORGANIC
	should_draw_greyscale = FALSE

/obj/item/bodypart/l_arm/vox
	icon_static = 'orbstation/icons/mob/species/vox/bodyparts.dmi'
	uses_mutcolor = TRUE
	limb_id = SPECIES_VOX
	bodytype = BODYTYPE_VOX | BODYTYPE_ORGANIC
	should_draw_greyscale = FALSE

/obj/item/bodypart/r_arm/vox
	icon_static = 'orbstation/icons/mob/species/vox/bodyparts.dmi'
	uses_mutcolor = TRUE
	limb_id = SPECIES_VOX
	bodytype = BODYTYPE_VOX | BODYTYPE_ORGANIC
	should_draw_greyscale = FALSE

/obj/item/bodypart/l_leg/vox
	icon_static = 'orbstation/icons/mob/species/vox/bodyparts.dmi'
	uses_mutcolor = TRUE
	limb_id = SPECIES_VOX
	bodytype = BODYTYPE_VOX | BODYTYPE_ORGANIC
	should_draw_greyscale = FALSE
	max_damage = 75 //BIG MEATY THIGHS

/obj/item/bodypart/r_leg/vox
	icon_static = 'orbstation/icons/mob/species/vox/bodyparts.dmi'
	uses_mutcolor = TRUE
	limb_id = SPECIES_VOX
	bodytype = BODYTYPE_VOX | BODYTYPE_ORGANIC
	should_draw_greyscale = FALSE
	max_damage = 75
