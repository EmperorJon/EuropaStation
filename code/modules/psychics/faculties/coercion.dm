var/static/list/coercion_spasm_limbs = list(
	BP_L_ARM =   TRUE,
	BP_R_ARM =  TRUE,
	BP_L_HAND =  TRUE,
	BP_R_HAND = TRUE
	)

/decl/psipower/coercion
	faculty = PSI_COERCION

/decl/psipower/coercion/blindstrike
	name =           "Blindstrike"
	cost =           8
	cooldown =       50
	use_ranged =     TRUE
	use_melee =      TRUE
	min_rank =       PSI_RANK_OPERANT
	use_description = "Target the head, eyes or mouth on disarm intent to use a ranged attack that blinds and disorients the target."

/decl/psipower/coercion/blindstrike/invoke(var/mob/living/user, var/mob/living/target)
	if(!istype(target) || (user.zone_sel.selecting != BP_HEAD && user.zone_sel.selecting != BP_MOUTH && user.zone_sel.selecting != BP_EYES) || target.stat != CONSCIOUS)
		return FALSE
	. = ..()
	if(.)
		to_chat(user, "<span class='danger'>You overwhelm \the [target]'s senses with a blast of mental white noise!</span>")
		if(prob(60)) target.emote("scream")
		to_chat(target, "<span class='danger'>Your sense are blasted into oblivion by a burst of mental static!</span>")
		target.flash_eyes()
		target.eye_blind = max(target.eye_blind,3)
		target.ear_deaf = max(target.ear_deaf,6)
		return TRUE

/decl/psipower/coercion/agony
	name =          "Agony"
	cost =          8
	cooldown =      50
	use_melee =     TRUE
	min_rank =      PSI_RANK_MASTER
	use_description = "Target the chest or groin on disarm intent to use a melee attack equivalent to a strike from a stun baton."

/decl/psipower/coercion/agony/invoke(var/mob/living/user, var/mob/living/target)
	if(!istype(target))
		return FALSE
	if(user.zone_sel.selecting != BP_CHEST && user.zone_sel.selecting != BP_GROIN)
		return FALSE
	. = ..()
	if(.)
		user.visible_message("<span class='danger'>\The [target] has been struck by \the [user]!</span>")
		playsound(user.loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
		target.stun_effect_act(0, 60, user.zone_sel.selecting)
		return TRUE

/decl/psipower/coercion/spasm
	name =           "Spasm"
	cost =           15
	cooldown =       100
	use_melee =      TRUE
	use_ranged =     TRUE
	min_rank =       PSI_RANK_GRANDMASTER
	use_description = "Target the arms or hands on disarm intent to use a ranged attack that may rip the weapons away from target."

/decl/psipower/coercion/spasm/invoke(var/mob/living/user, var/mob/living/carbon/human/target)
	if(!istype(target))
		return FALSE
	if(!coercion_spasm_limbs[user.zone_sel.selecting])
		return FALSE
	. = ..()
	if(.)
		to_chat(user, "<span class='danger'>You lash out, stabbing into \the [target] with a lance of psi-power.</span>")
		to_chat(target, "<span class='danger'>The muscles in your arms cramp horrendously!</span>")
		if(prob(75))
			target.emote("scream")
		if(prob(75) && target.l_hand && !target.l_hand.abstract && target.unEquip(target.l_hand))
			target.visible_message("<span class='danger'>\The [target] drops what they were holding as their left hand spasms!</span>")
		if(prob(75) && target.r_hand && !target.r_hand.abstract && target.unEquip(target.r_hand))
			target.visible_message("<span class='danger'>\The [target] drops what they were holding as their right hand spasms!</span>")
		return TRUE

/decl/psipower/coercion/mindslave
	name =          "Mindslave"
	cost =          28
	cooldown =      200
	use_grab =      TRUE
	min_rank =      PSI_RANK_PARAMOUNT
	use_description = "Grab a victim, target the head, then use the grab on them while on disarm intent, in order to convert them into a loyal mind-slave. The process takes some time, and failure is punished harshly."

/decl/psipower/coercion/mindslave/invoke(var/mob/living/user, var/mob/living/target)
	if(!istype(target) || user.zone_sel.selecting != BP_HEAD)
		return FALSE
	. = ..()
	if(.)
		if(target.stat == DEAD || (target.status_flags & FAKEDEATH))
			to_chat(user, "<span class='warning'>\The [target] is dead!</span>")
			return TRUE
		if(!target.mind || !target.key)
			to_chat(user, "<span class='warning'>\The [target] is mindless!</span>")
			return TRUE
		if(thralls.is_antagonist(target.mind))
			to_chat(user, "<span class='warning'>\The [target] is already in thrall to someone!</span>")
			return TRUE
		user.visible_message("<span class='danger'><i>\The [user] seizes the head of \the [target] in both hands...</i></span>")
		to_chat(user, "<span class='warning'>You plunge your mentality into that of \the [target]...</span>")
		to_chat(target, "<span class='danger'>Your mind is invaded by the presence of \the [user]! They are trying to make you a slave!</span>")
		if(!do_after(user, target.stat == CONSCIOUS ? 80 : 40, target, 0, 1))
			user.psi.backblast(rand(10,25))
			return TRUE
		to_chat(user, "<span class='danger'>You sear through \the [target]'s neurons, reshaping as you see fit and leaving them subservient to your will!</span>")
		to_chat(target, "<span class='danger'>Your defenses have eroded away and \the [user] has made you their mindslave.</span>")
		thralls.add_antagonist(target.mind, new_controller = user)
		return TRUE

/decl/psipower/coercion/probe
	name =            "Probe"
	cost =            15
	cooldown =        100
	use_grab =        TRUE
	min_rank =        PSI_RANK_GRANDMASTER
	use_description = "Grab a victim, target the eyes, then use the grab on them while on disarm intent, in order to perform a deep coercive-redactive probe of their innermost secrets."

/decl/psipower/coercion/probe/invoke(var/mob/living/user, var/mob/living/target)
	if(user.zone_sel.selecting != BP_EYES)
		return FALSE
	. = ..()
	if(.)
		user.visible_message("<span class='danger'><i>\The [user] grips the head of \the [target] in both hands...</i></span>")
		to_chat(user, "<span class='warning'>You plunge your mentality into that of \the [target]...</span>")
		to_chat(target, "<span class='danger'>Your persona is scrutinized by the psychic lens of \the [user]. They are trying to read your mind!</span>")
		if(!do_after(user, target.stat == CONSCIOUS ? 50 : 25, target, 0, 1))
			user.psi.backblast(rand(5,10))
			return TRUE
		to_chat(user, "<span class='notice'>You retreat from \the [target], holding your new knowledge close.</span>")
		to_chat(target, "<span class='danger'>Your mental complexus is laid bare to judgement of \the [user].</span>")
		target.show_psi_assay(user)
		return TRUE
