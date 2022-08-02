//Orbstation: random unique name generation for new species

/proc/random_unique_vox_name(gender, attempts_to_find_unique_name=10)
	for(var/i in 1 to attempts_to_find_unique_name)
		. = capitalize(vox_name(gender))

		if(!findname(.))
			break
