/mob/living/carbon/xenomorph/beetle
	caste_base_type = /datum/xeno_caste/beetle
	name = "Beetle"
	desc = "A bulky, six-legged alien with a horn. Its carapace seems quite durable."
	icon = 'icons/Xeno/castes/beetle.dmi'
	icon_state = "Beetle Walking"
	health = 200
	maxHealth = 200
	plasma_stored = 50
	pixel_x = -16
	old_x = -16
	tier = XENO_TIER_MINION
	upgrade = XENO_UPGRADE_BASETYPE
	pull_speed = -2

/mob/living/carbon/xenomorph/beetle/on_death()
	///We QDEL them as cleanup and preventing them from being sold
	QDEL_IN(src, TIME_TO_DISSOLVE)
	return ..()
