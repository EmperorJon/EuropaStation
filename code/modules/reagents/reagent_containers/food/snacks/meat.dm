/obj/item/reagent_containers/food/snacks/meat
	name = "meat"
	desc = "A slab of meat."
	icon_state = "meat1"
	health = 180
	filling_color = "#FF1C1C"
	center_of_mass = "x=16;y=14"
	bitesize = 3

	var/source_mob

/obj/item/reagent_containers/food/snacks/meat/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_PROTEIN, 9)

/obj/item/reagent_containers/food/snacks/meat/Initialize()
	. = ..()
	if(source_mob) set_source_mob(source_mob)
	if(icon_state == "meat1")
		icon_state = pick(list("meat1","meat2","meat3","meat4"))

/obj/item/reagent_containers/food/snacks/meat/proc/set_source_mob(var/new_source_mob)
	source_mob = new_source_mob
	if(source_mob)
		name = "[source_mob] [initial(name)]"
	else
		name = "[initial(name)]"
	return

/obj/item/reagent_containers/food/snacks/meat/proc/produce_sliced_product()
	new /obj/item/reagent_containers/food/snacks/rawcutlet(src)
	new /obj/item/reagent_containers/food/snacks/rawcutlet(src)
	new /obj/item/reagent_containers/food/snacks/rawcutlet(src)

/obj/item/reagent_containers/food/snacks/meat/attackby(var/obj/item/W, var/mob/user)
	if(is_sharp(W) && (locate(/obj/structure/table) in loc))
		user.visible_message("<span class='notice'>\The [user] slices \the [src] into thin strips.</span>")
		produce_sliced_product()
		qdel(src)
	else
		..()

/obj/item/reagent_containers/food/snacks/meat/syntiflesh
	name = "synthetic meat"
	desc = "A synthetic slab of flesh."

// Seperate definitions because some food likes to know if it's human.
// TODO: rewrite kitchen code to check a var on the meat item so we can remove
// all these sybtypes.
/obj/item/reagent_containers/food/snacks/meat/human
/obj/item/reagent_containers/food/snacks/meat/monkey
	//same as plain meat

/obj/item/reagent_containers/food/snacks/meat/corgi
	name = "Corgi meat"
	desc = "Tastes like... well, you know."


/obj/item/reagent_containers/food/snacks/meat/bearmeat
	name = "bear meat"
	desc = "A very manly slab of meat."
	icon_state = "bearmeat"
	filling_color = "#DB0000"
	center_of_mass = "x=16;y=10"
	protein_amt = 12
	bitesize = 3

/obj/item/reagent_containers/food/snacks/meat/bearmeat/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_JUMPSTART, 5)
