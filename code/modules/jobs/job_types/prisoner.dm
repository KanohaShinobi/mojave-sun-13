/datum/job/prisoner
<<<<<<< HEAD
	title = "Prisoner"
=======
	title = JOB_PRISONER
	description = "Keep yourself occupied in permabrig."
>>>>>>> 2834383245d... Makes all default job titles, defines. (#63357)
	department_head = list("The Security Team")
	faction = FACTION_STATION
	total_positions = 0
	spawn_positions = 2
	supervisors = "the security team"
	selection_color = "#ffe1c3"
	exp_granted_type = EXP_TYPE_CREW
	paycheck = PAYCHECK_PRISONER

	outfit = /datum/outfit/job/prisoner
	plasmaman_outfit = /datum/outfit/plasmaman/prisoner

	display_order = JOB_DISPLAY_ORDER_PRISONER

	exclusive_mail_goodies = TRUE
	mail_goodies = list (
		/obj/effect/spawner/random/contraband/prison = 1
	)

	family_heirlooms = list(/obj/item/pen/blue)
	rpg_title = "Defeated Miniboss"
	job_flags = NONE 	/// MS13 EDIT -ORIGINAL FLAGS 	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS


/datum/outfit/job/prisoner
	name = "Prisoner"
	jobtype = /datum/job/prisoner

	id = /obj/item/card/id/advanced/prisoner
	id_trim = /datum/id_trim/job/prisoner
	uniform = /obj/item/clothing/under/rank/prisoner
	belt = null
	ears = null
	shoes = /obj/item/clothing/shoes/sneakers/orange

/datum/outfit/job/prisoner/post_equip(mob/living/carbon/human/new_prisoner, visualsOnly)
	. = ..()
	if(!length(SSpersistence.prison_tattoos_to_use) || visualsOnly)
		return
	var/obj/item/bodypart/tatted_limb = pick(new_prisoner.bodyparts)
	var/list/tattoo = pick(SSpersistence.prison_tattoos_to_use)
	tatted_limb.AddComponent(/datum/component/tattoo, tattoo["story"])
	SSpersistence.prison_tattoos_to_use -= tattoo
