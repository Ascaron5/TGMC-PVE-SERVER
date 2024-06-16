/obj/vehicle/sealed/armored/multitile
	name = "\improper MT - Banteng"
	desc = "A gigantic wall of metal designed for maximum Xeno destruction. Drag yourself onto it at an entrance to get inside."
	icon = 'icons/obj/armored/3x3/tank.dmi'
	turret_icon = 'icons/obj/armored/3x3/tank_gun.dmi'
	damage_icon_path = 'icons/obj/armored/3x3/tank_damage.dmi'
	icon_state = "tank"
	hitbox = /obj/hitbox
//	interior = /datum/interior/armored
	minimap_icon_state = "tank"
	required_entry_skill = SKILL_LARGE_VEHICLE_TRAINED
	atom_flags = DIRLOCK|BUMP_ATTACKABLE|PREVENT_CONTENTS_EXPLOSION
	armored_flags = ARMORED_HAS_PRIMARY_WEAPON|ARMORED_HAS_SECONDARY_WEAPON|ARMORED_HAS_UNDERLAY|ARMORED_HAS_HEADLIGHTS|ARMORED_PURCHASABLE_ASSAULT
	pixel_x = -56
	pixel_y = -48
	max_integrity = 1400
	soft_armor = list(MELEE = 50, BULLET = 100 , LASER = 90, ENERGY = 60, BOMB = 60, BIO = 60, FIRE = 50, ACID = 50)
	hard_armor = list(MELEE = 0, BULLET = 20, LASER = 20, ENERGY = 20, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)
	permitted_mods = list(/obj/item/tank_module/overdrive, /obj/item/tank_module/ability/zoom)
	max_occupants = 6
	move_delay = 0.9 SECONDS
	ram_damage = 100
	easy_load_list = list(
		/obj/item/ammo_magazine/tank,
	)
	var/Faction = FACTION_TERRAGOV

/obj/vehicle/sealed/armored/multitile/enter_locations(atom/movable/entering_thing)
	return list(get_step_away(get_step(src, REVERSE_DIR(dir)), src, 2))

/obj/vehicle/sealed/armored/multitile/exit_location(mob/M)
	return pick(enter_locations(M))

/obj/vehicle/sealed/armored/multitile/enter_checks(mob/entering_mob, loc_override = FALSE)
	. = ..()
	if(!.)
		return
	return (loc_override || (entering_mob.loc in enter_locations(entering_mob)))

/obj/vehicle/sealed/armored/multitile/ex_act(severity)
	if(QDELETED(src))
		return
	switch(severity)
		if(EXPLODE_DEVASTATE)
			take_damage(INFINITY, BRUTE, BOMB, 0)
		if(EXPLODE_HEAVY)
			take_damage(80, BRUTE, BOMB, 0)
		if(EXPLODE_LIGHT)
			take_damage(10, BRUTE, BOMB, 0)
		//weak explosions do nothing

/obj/vehicle/sealed/armored/multitile/lava_act()
	if(QDELETED(src))
		return
	take_damage(30, BURN, FIRE)
