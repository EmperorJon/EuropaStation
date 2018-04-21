/datum/psi_complexus
	var/suppressed = TRUE             // Whether or not we are suppressing our psi powers.
	var/use_intimate_mode = FALSE     // Whether or not we are using the intimate telepathic mode.
	var/rebuild_power_cache = TRUE    // Whether or not we need to rebuild our cache of psi powers.

	var/rating = 0                    // Overall psi rating.
	var/cost_modifier = 1             // Multiplier for power use stamina costs.
	var/stun = 0                      // Number of process ticks we are stunned for.
	var/next_power_use = 0            // world.time minimum before next power use.
	var/stamina = 30                  // Current psi pool.
	var/max_stamina = 30              // Max psi pool.

	var/list/latencies                // List of all currently latent faculties.
	var/list/ranks                    // Assoc list of psi faculties to current rank.
	var/list/base_ranks               // Assoc list of psi faculties to base rank, in case reset is needed
	var/list/manifested_items         // List of atoms manifested/maintained by psychic power.
	var/next_latency_trigger = 0      // world.time minimum before a trigger can be attempted again.
	var/last_armor_check              // world.time of last armour check.
	var/last_aura_size
	var/last_aura_alpha
	var/last_aura_color
	var/aura_color = "#FF0022"

	// Cached powers.
	var/list/melee_powers             // Powers used in melee range.
	var/list/grab_powers              // Powers use by using a grab.
	var/list/ranged_powers            // Powers used at range.
	var/list/manifestation_powers     // Powers that create an item.
	var/list/powers_by_faculty        // All powers within a given faculty.

	var/obj/screen/psi/hub/ui	      // Reference to the master psi UI object.
	var/mob/living/owner              // Reference to our owner.
	var/image/aura_image              // Client image

/datum/psi_complexus/New(var/mob/_owner)

	owner = _owner

	//aura_image = image(loc = owner, icon = 'icons/effects/psi_aura.dmi', icon_state = "aura")
	aura_image = image(loc = owner, icon = 'icons/effects/psi_aura_small.dmi', icon_state = "aura")

	aura_image.blend_mode = BLEND_SUBTRACT
	//aura_image.pixel_x = -25
	//aura_image.pixel_y = -25
	aura_image.layer = TURF_LAYER + 0.5
	aura_image.alpha = 0
	aura_image.mouse_opacity = 0

	START_PROCESSING(SSpsi, src)

	// Add initial aura.
	for(var/thing in SSpsi.processing)
		var/datum/psi_complexus/psychic = thing
		if(psychic.owner.client && !psychic.suppressed)
			psychic.owner.client.images += aura_image
	all_aura_images[aura_image] = TRUE

/datum/psi_complexus/Destroy()

	// Remove aura.
	for(var/thing in SSpsi.processing)
		var/datum/psi_complexus/psychic = thing
		if(psychic.owner.client)
			psychic.owner.client.images -= aura_image
	all_aura_images -= aura_image

	STOP_PROCESSING(SSpsi, src)
	if(owner)
		cancel()
		if(owner.client)
			owner.client.screen -= list(ui, ui.components)
			for(var/thing in all_aura_images)
				owner.client.images -= thing
		qdel(ui)
		ui = null
		owner.verbs -= /mob/living/proc/say_telepathy
		owner.psi = null
		owner = null

	if(manifested_items)
		manifested_items.Cut()
	. = ..()
