/datum/antagonist/revolutionary/New()
	restricted_job_types |= list(/datum/job/chief_engineer, /datum/job/administrator, /datum/job/captain, /datum/job/hos, /datum/job/scientist, /datum/job/cmo)
	protected_job_types |= list(/datum/job/officer, /datum/job/warden)
	..()

/datum/antagonist/traitor/New()
	protected_job_types |= list(/datum/job/officer, /datum/job/warden, /datum/job/hos, /datum/job/captain)
	..()

/datum/map/yonaguni
	default_role = "Employee"
	default_job_type = /datum/job/crewman/employee
	allowed_jobs = list(
		/datum/job/crewman/employee,
		/datum/job/captain,
		/datum/job/administrator,
		/datum/job/chief_engineer,
		/datum/job/engineer,
		/datum/job/roboticist,
		/datum/job/chef,
		/datum/job/qm,
		/datum/job/mining,
		/datum/job/cargo_tech,
		/datum/job/janitor,
		/datum/job/hos,
		/datum/job/warden,
		/datum/job/officer,
		/datum/job/forensics,
		/datum/job/scientist,
		/datum/job/cmo,
		/datum/job/doctor,
		/datum/job/psychiatrist,
		/datum/job/foundation_agent,
		/datum/job/foundation_liaison,
		/datum/job/ai,
		/datum/job/cyborg
		)

/datum/job/crewman/employee
	title = "Employee"
	supervisors = "absolutely everyone"
	welcome_blurb = "Research facilities often need people to do odd jobs. Today, that would be you."

/datum/job/captain
	title = "Colony Director"
	welcome_blurb = "You are in charge of the entire colony and everyone on it. Keep it running smoothly. The buck stops with you."
	department = "Command"
	head_position = 1
	department_flag = COM
	faction = "Crew"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the PicoMotion board of investors and the Jovian Naval Authority"
	selection_color = "#1d1d4f"
	req_admin_notify = 1
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	minimal_player_age = 14
	economic_modifier = 20

	ideal_character_age = 70 // Old geezer captains ftw
	outfit_type = /decl/hierarchy/outfit/job/colony_director

/datum/job/captain/New()
	id_modifying_ranks |= title
	..()

/datum/job/captain/get_access()
	return get_all_station_access()

/datum/job/administrator
	title = "Deputy Director"
	welcome_blurb = "Assist the Colony Director in managing the crew and keeping the station running. Hand out access to those who need it, or terminate access for those who have been fired."
	head_position = 1
	department_flag = COM|CIV
	faction = "Crew"
	total_positions = 3
	spawn_positions = 1
	supervisors = "the Colony Director"
	selection_color = "#2f2f7f"
	minimal_player_age = 14
	economic_modifier = 10
	ideal_character_age = 50

	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_medical, access_engine, access_change_ids, access_ai_upload, access_eva, access_heads,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_medical, access_engine, access_change_ids, access_ai_upload, access_eva, access_heads,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway)

	outfit_type = /decl/hierarchy/outfit/job/colony_administrator
// End placeholder

/datum/job/chief_engineer
	title = "Chief of Engineering"
	welcome_blurb = "Coordinate and direct the Engineering department in keeping the facility in one piece. Try not to go mad."
	head_position = 1
	department = "Engineering"
	department_flag = ENG|COM
	faction = "Crew"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Colony Director"
	selection_color = "#7f6e2c"
	req_admin_notify = 1
	economic_modifier = 10

	ideal_character_age = 50


	access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
			            access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
			            access_heads, access_construction, access_sec_doors,
			            access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload)
	minimal_access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
			            access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
			            access_heads, access_construction, access_sec_doors,
			            access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload)
	minimal_player_age = 14
	outfit_type = /decl/hierarchy/outfit/job/europa_engineer/coe

/datum/job/engineer
	title = "Engineer"
	welcome_blurb = "Keep the lights on, the water out, and the power flowing. Easier said than done."
	department = "Engineering"
	department_flag = ENG
	faction = "Crew"
	total_positions = 5
	spawn_positions = 5
	supervisors = "the Chief of Engineering"
	selection_color = "#5b4d20"
	economic_modifier = 5
	minimal_player_age = 7
	access = list(access_eva, access_engine, access_atmospherics, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics)
	minimal_access = list(access_eva, access_atmospherics, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction)
	alt_titles = list("Maintenance Technician","Engine Technician","Life Support Technician")
	outfit_type = /decl/hierarchy/outfit/job/europa_engineer

/datum/job/roboticist
	title = "Roboticist"
	welcome_blurb = "Build and maintain station robots, install and repair prosthetic limbs, and flaunt your doctorate over the rest of Engineering."
	department = "Engineering"
	department_flag = ENG
	faction = "Crew"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief of Engineering"
	selection_color = "#5b4d20"
	economic_modifier = 5
	access = list(access_robotics, access_tox, access_tox_storage, access_tech_storage, access_morgue, access_research) //As a job that handles so many corpses, it makes sense for them to have morgue access.
	minimal_access = list(access_robotics, access_tech_storage, access_morgue, access_research) //As a job that handles so many corpses, it makes sense for them to have morgue access.
	minimal_player_age = 3
	outfit_type = /decl/hierarchy/outfit/job/europa_engineer/roboticist

//Food
/datum/job/chef
	title = "Cook"
	welcome_blurb = "Grow food and stock the cafeteria with meals and drinks to keep the crew moving. Avoid letting them find out you're serving them monkey steak."
	department = "Civilian"
	department_flag = CIV
	faction = "Crew"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief of Logistics"
	selection_color = "#515151"
	access = list(access_hydroponics, access_bar, access_kitchen)
	minimal_access = list(access_kitchen)
	outfit_type = /decl/hierarchy/outfit/job/europa_chef

//Cargo
/datum/job/qm
	title = "Chief of Logistics"
	welcome_blurb = "Direct and coordinate the Supply department. Make orders, deploy supply beacons, and draft Employees to drag crates around when you can't be bothered."
	head_position = 1
	department = "Civilian"
	department_flag = CIV|CRG
	faction = "Crew"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Colony Director"
	selection_color = "#737373"
	economic_modifier = 5
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	minimal_player_age = 3
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/europa_chief_of_logistics

/datum/job/janitor
	title = "Sanitation Technician"
	welcome_blurb = "Keep the station clean and tidy. Put out wet floor signs while mopping and watch people slip over anyway."
	department = "Civilian"
	department_flag = CIV
	faction = "Crew"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Chief of Logistics"
	selection_color = "#515151"
	access = list(access_janitor, access_maint_tunnels, access_engine, access_research, access_sec_doors, access_medical)
	minimal_access = list(access_janitor, access_maint_tunnels, access_engine, access_research, access_sec_doors, access_medical)
	outfit_type = /decl/hierarchy/outfit/job/europa_janitor

/datum/job/hos
	title = "Chief of Police"
	welcome_blurb = "Direct and coordinate the colonial police."
	head_position = 1
	department = "Police"
	department_flag = SEC|COM
	faction = "Crew"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Colony Director"
	selection_color = "#000050"
	req_admin_notify = 1
	economic_modifier = 10
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks)
	minimal_player_age = 14
	outfit_type = /decl/hierarchy/outfit/job/police/chief

/datum/job/hos/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)

/datum/job/warden
	title = "Police Quartermaster"
	welcome_blurb = "Look after the armory, hand out weapons as directed, and keep an eye on any prisoners in the brig."
	department = "Police"
	department_flag = SEC
	faction = "Crew"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Chief of Police"
	selection_color = "#000080"
	economic_modifier = 5
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_morgue, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_external_airlocks)
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/police/quartermaster

/datum/job/officer
	title = "Police Officer"
	welcome_blurb = "Keep the peace amongst the crew. Sort out small disturbances and fights, and coordinate with your team to respond to larger crises."
	department = "Police"
	department_flag = SEC
	faction = "Crew"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Chief of Police"
	selection_color = "#000080"
	alt_titles = list("Junior Officer")
	economic_modifier = 4
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_external_airlocks)
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/police

/datum/job/forensics
	title = "Forensic Technician"
	welcome_blurb = "Examine evidence, conduct investiations, and follow leads."
	department = "Police"
	department_flag = SEC
	faction = "Crew"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Chief of Police"
	selection_color = "#000080"
	economic_modifier = 4
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_external_airlocks)
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/police/forensics

/datum/job/scientist
	title = "Scientist"
	welcome_blurb = "You have a PhD, a laboratory full of gizmos, and nothing but free time. Make the most of it."
	department = "Science"
	department_flag = SCI
	faction = "Crew"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Colony Director"
	selection_color = "#ad6bad"
	req_admin_notify = 1
	economic_modifier = 15
	access = list(access_rd, access_tox, access_genetics, access_morgue,
			            access_tox_storage, access_teleporter, access_sec_doors,
			            access_research, access_robotics, access_xenobiology, access_ai_upload, access_tech_storage,
			            access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_xenoarch, access_network)
	minimal_access = list(access_rd, access_tox, access_genetics, access_morgue,
			            access_tox_storage, access_teleporter, access_sec_doors,
			            access_research, access_robotics, access_xenobiology, access_ai_upload, access_tech_storage,
			            access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_xenoarch, access_network)
	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_hydroponics)
	minimal_player_age = 14
	ideal_character_age = 50
	alt_titles = list("Xenobiologist")
	outfit_type = /decl/hierarchy/outfit/job/europa_scientist


/datum/job/cmo
	title = "Chief of Medicine"
	welcome_blurb = "Direct and coordinate the Medical crew. Don't forget to feed Ganymede."
	head_position = 1
	department = "Medical"
	department_flag = MED|COM
	faction = "Crew"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Colony Director"
	selection_color = "#026865"
	req_admin_notify = 1
	economic_modifier = 10
	access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_external_airlocks)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_external_airlocks)

	minimal_player_age = 14
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/europa_doctor/com

/datum/job/doctor
	title = "Doctor"
	welcome_blurb = "Treat wounds, mix medicines, administer pills, and conduct surgery. Try to keep at least some of the crew alive."
	department = "Medical"
	department_flag = MED
	faction = "Crew"
	minimal_player_age = 3
	total_positions = 5
	spawn_positions = 3
	supervisors = "the Chief of Medicine"
	selection_color = "#013d3b"
	economic_modifier = 7
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_chemistry)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_virology, access_chemistry)
	alt_titles = list(
		"Surgeon" = /decl/hierarchy/outfit/job/europa_doctor/surgeon,
		"Emergency Physician" = /decl/hierarchy/outfit/job/europa_doctor/emt,
		"Virologist" = /decl/hierarchy/outfit/job/europa_doctor/virologist
		)
	outfit_type = /decl/hierarchy/outfit/job/europa_doctor

/datum/job/psychiatrist
	title = "Counsellor"
	department = "Medical"
	department_flag = MED
	faction = "Crew"
	total_positions = 1
	spawn_positions = 1
	economic_modifier = 5
	minimal_player_age = 3
	supervisors = "the Chief of Medicine"
	selection_color = "#013d3b"
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_psychiatrist)
	minimal_access = list(access_medical, access_medical_equip, access_psychiatrist)
	outfit_type = /decl/hierarchy/outfit/job/europa_doctor/counsellor

/datum/job/cargo_tech
	title = "Supply Technician"
	welcome_blurb = "Take orders for new equipment, encode supply chits via the main console, and take supply beacons out for ballistic supply pod delivery. Try not to stand under them."
	department = "Supply"
	department_flag = CRG
	faction = "Crew"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief of Logistics"
	selection_color = "#515151"
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_cargo, access_cargo_bot, access_mailsorting)
	outfit_type = /decl/hierarchy/outfit/job/europa_supply

/datum/job/mining
	title = "Salvage Diver"
	welcome_blurb = "Head out into the abyssal caves to find and recover scrap metal, materials, black box recorders and artefacts."
	department = "Supply"
	department_flag = CRG
	faction = "Crew"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Chief of Logistics"
	selection_color = "#515151"
	economic_modifier = 5
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	minimal_access = list(access_mining, access_mining_station, access_mailsorting)
	outfit_type = /decl/hierarchy/outfit/job/europa_salvager

/datum/job/foundation_agent
	title = "Foundation Agent"
	welcome_blurb = "You are a Cuchulain Foundation field agent on secondment to your current site. When there's something strange in the neighborhood, you're the one they call."
	department = "Medical"
	department_flag = MED
	faction = "Crew"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Cuchulain Foundation advisory board, the Psionics Liaison, the Chief of Medicine, and your own conscience, in that order"
	selection_color = "#6755e0"
	access = list(access_foundation, access_medical, access_medical_equip, access_surgery, access_psychiatrist)
	minimal_access = list(access_foundation, access_medical, access_medical_equip, access_surgery, access_psychiatrist)
	minimal_player_age = 14
	economic_modifier = 9
	outfit_type = /decl/hierarchy/outfit/job/foundation/agent

/datum/job/foundation_agent/New()
	..()
	psi_faculties = list(
		"[PSI_COERCION]" = PSI_RANK_MASTER,
		"[PSI_ENERGISTICS]" = PSI_RANK_MASTER
	)

/datum/job/foundation_liaison
	title = "Psionics Liaison"
	welcome_blurb = "You are a representative of the Cuchulain Foundation, serving as a consultant to the crew on psionic matters."
	department = "Medical"
	department_flag = MED
	faction = "Crew"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Cuchulain Foundation advisory board, the Chief of Medicine, and your own conscience, in that order"
	selection_color = "#8271f2"
	access = list()
	minimal_access = list()
	minimal_player_age = 14
	economic_modifier = 12
	outfit_type = /decl/hierarchy/outfit/job/foundation
	access = list(access_foundation, access_medical, access_medical_equip, access_surgery, access_psychiatrist)
	minimal_access = list(access_foundation, access_medical, access_medical_equip, access_surgery, access_psychiatrist)

/datum/job/foundation_liaison/New()
	..()
	psi_faculties = list("[PSI_REDACTION]" = PSI_RANK_GRANDMASTER)

/obj/effect/landmark/start/salvage
	name = "Salvage Diver"

/obj/effect/landmark/start/supply_tech
	name = "Supply Technician"

/obj/effect/landmark/start/employee
	name = "Employee"

/obj/effect/landmark/start/site_director
	name = "Colony Director"

/obj/effect/landmark/start/deputy_director
	name = "Deputy Director"

/obj/effect/landmark/start/alien
	name = "Visitor"

/obj/effect/landmark/start/qm
	name = "Chief of Logistics"

/obj/effect/landmark/start/janitor
	name = "Sanitation Technician"

/obj/effect/landmark/start/cook
	name = "Cook"

/obj/effect/landmark/start/coe
	name = "Chief of Engineering"

/obj/effect/landmark/start/engineer
	name = "Engineer"

/obj/effect/landmark/start/roboticist
	name = "Roboticist"

/obj/effect/landmark/start/cmo
	name = "Chief of Medicine"

/obj/effect/landmark/start/medical_officer
	name = "Doctor"

/obj/effect/landmark/start/counsellor
	name = "Counsellor"

/obj/effect/landmark/start/xenobio
	name = "Xenobiologist"

/obj/effect/landmark/start/science_officer
	name = "Scientist"

/obj/effect/landmark/start/cos
	name = "Chief of Police"

/obj/effect/landmark/start/munitions_officer
	name = "Police Quartermaster"

/obj/effect/landmark/start/security_officer
	name = "Police Officer"

/obj/effect/landmark/start/security_forensics
	name = "Forensic Technician"

/obj/effect/landmark/start/colonist
	name = "Colonist"

/obj/effect/landmark/start/foundation_agent
	name = "Foundation Agent"

/obj/effect/landmark/start/foundation_counsellor
	name = "Psionics Liaison"
