/obj/item/handcuffs
	name = "handcuffs"
	desc = "Use this to keep prisoners in line."
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "handcuff"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	throwforce = 5
	w_class = 2.0
	throw_speed = 2
	throw_range = 5

	matter = list(MATERIAL_STEEL = 500)
	var/elastic
	var/dispenser = 0
	var/breakouttime = 1200 //Deciseconds = 120s = 2 minutes
	var/cuff_sound = 'sound/weapons/handcuffs.ogg'
	var/cuff_type = "handcuffs"
	sprite_sheets = list(BODYTYPE_CORVID = 'icons/mob/species/corvid/handcuffs.dmi')

/obj/item/handcuffs/get_mob_overlay(mob/user_mob, slot)
	var/image/ret = ..()
	if(slot == slot_handcuffed_str)
		ret.icon_state = "handcuff1"
	if(slot == slot_legcuffed_str)
		ret.icon_state = "legcuff1"
	return ret

/obj/item/handcuffs/attack(var/mob/living/carbon/C, var/mob/living/user)

	if(!user.IsAdvancedToolUser())
		return

	if(!C.handcuffed)
		if (C == user)
			place_handcuffs(user, user)
			return

		//check for an aggressive grab (or robutts)
		var/can_place
		if(istype(user, /mob/living/silicon/robot))
			can_place = 1
		else
			for (var/obj/item/grab/G in C.grabbed_by)
				if (G.loc == user && G.state >= GRAB_AGGRESSIVE)
					can_place = 1
					break

		if(can_place)
			place_handcuffs(C, user)
		else
			user << "<span class='danger'>You need to have a firm grip on [C] before you can put \the [src] on!</span>"

/obj/item/handcuffs/proc/place_handcuffs(var/mob/living/carbon/target, var/mob/user)
	playsound(src.loc, cuff_sound, 30, 1, -2)

	var/mob/living/carbon/human/H = target
	if(!istype(H))
		return 0

	if (!H.has_organ_for_slot(slot_handcuffed))
		user << "<span class='danger'>\The [H] needs at least two wrists before you can cuff them together!</span>"
		return 0

	if(istype(H.gloves,/obj/item/clothing/gloves/rig) && !elastic) // Can't cuff someone who's in a deployed hardsuit.
		user << "<span class='danger'>\The [src] won't fit around \the [H.gloves]!</span>"
		return 0

	user.visible_message("<span class='danger'>\The [user] is attempting to put [cuff_type] on \the [H]!</span>")

	if(!do_after(user,30, target))
		return 0

	H.attack_log += text("\[[time_stamp()]\] <font color='orange'>Has been handcuffed (attempt) by [user.name] ([user.ckey])</font>")
	user.attack_log += text("\[[time_stamp()]\] <font color='red'>Attempted to handcuff [H.name] ([H.ckey])</font>")
	msg_admin_attack("[key_name(user)] attempted to handcuff [key_name(H)]")
	feedback_add_details("handcuffs","H")

	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	user.do_attack_animation(H)

	user.visible_message("<span class='danger'>\The [user] has put [cuff_type] on \the [H]!</span>")

	// Apply cuffs.
	var/obj/item/handcuffs/cuffs = src
	if(dispenser)
		cuffs = new(get_turf(user))
	else
		user.drop_from_inventory(cuffs)
	target.equip_to_slot(cuffs,slot_handcuffed)
	return 1

var/last_chew = 0
/mob/living/carbon/human/RestrainedClickOn(var/atom/A)
	if (A != src) return ..()
	if (last_chew + 26 > world.time) return

	var/mob/living/carbon/human/H = A
	if (!H.handcuffed) return
	if (H.a_intent != I_HURT) return
	if (H.zone_sel.selecting != BP_MOUTH) return
	if (H.wear_mask) return
	if (istype(H.wear_suit, /obj/item/clothing/suit/straight_jacket)) return

	var/obj/item/organ/external/O = H.organs_by_name[(H.hand ? BP_L_HAND : BP_R_HAND)]
	if (!O) return

	var/s = "<span class='warning'>[H.name] chews on \his [O.name]!</span>"
	H.visible_message(s, "<span class='warning'>You chew on your [O.name]!</span>")
	H.attack_log += text("\[[time_stamp()]\] <font color='red'>[s] ([H.ckey])</font>")
	log_attack("[s] ([H.ckey])")

	if(O.take_damage(3,0,1,1,"teeth marks"))
		H:UpdateDamageIcon()

	last_chew = world.time

/obj/item/handcuffs/cable
	name = "cable restraints"
	desc = "Looks like some cables tied together. Could be used to tie something up."
	icon_state = "cuff_white"
	breakouttime = 300 //Deciseconds = 30s
	cuff_sound = 'sound/weapons/cablecuff.ogg'
	cuff_type = "cable restraints"
	elastic = 1

/obj/item/handcuffs/cable/red
	color = "#DD0000"

/obj/item/handcuffs/cable/yellow
	color = "#DDDD00"

/obj/item/handcuffs/cable/blue
	color = "#0000DD"

/obj/item/handcuffs/cable/green
	color = "#00DD00"

/obj/item/handcuffs/cable/pink
	color = "#DD00DD"

/obj/item/handcuffs/cable/orange
	color = "#DD8800"

/obj/item/handcuffs/cable/cyan
	color = "#00DDDD"

/obj/item/handcuffs/cable/white
	color = "#FFFFFF"

/obj/item/handcuffs/cable/attackby(var/obj/item/I, var/mob/user)
	..()
	if(istype(I, /obj/item/stack/rods))
		var/obj/item/stack/rods/R = I
		if (R.use(1))
			var/obj/item/material/wirerod/W = new(get_turf(user))
			user.put_in_hands(W)
			user << "<span class='notice'>You wrap the cable restraint around the top of the rod.</span>"
			qdel(src)
			update_icon(user)

/obj/item/handcuffs/cyborg
	dispenser = 1

/obj/item/handcuffs/cable/tape
	name = "tape restraints"
	desc = "DIY!"
	icon_state = "tape_cross"
	item_state = null
	icon = 'icons/obj/bureaucracy.dmi'
	breakouttime = 200
	cuff_type = "duct tape"