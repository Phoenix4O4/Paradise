/**********************************************************************
						Cyborg Spec Items
***********************************************************************/
/obj/item/borg
	icon = 'icons/mob/robot_items.dmi'

/obj/item/borg/stun
	name = "electrically-charged arm"
	icon_state = "elecarm"
	var/charge_cost = 30

/obj/item/borg/stun/attack(mob/living/M, mob/living/silicon/robot/user)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.check_shields(src, 0, "[M]'s [name]", MELEE_ATTACK))
			playsound(M, 'sound/weapons/genhit.ogg', 50, 1)
			return 0

	if(isrobot(user))
		if(!user.cell.use(charge_cost))
			return

	user.do_attack_animation(M)
	M.Weaken(2 SECONDS)
	M.apply_effect(STUTTER, 10 SECONDS)
	M.apply_damage(20, STAMINA)

	M.visible_message("<span class='danger'>[user] has prodded [M] with [src]!</span>", \
					"<span class='userdanger'>[user] has prodded you with [src]!</span>")

	playsound(loc, 'sound/weapons/egloves.ogg', 50, 1, -1)
	add_attack_logs(user, M, "Stunned with [src] ([uppertext(user.a_intent)])")

/obj/item/gun/energy/emittercannon
	name = "Emitter Cannon"
	desc = "Looks clean and very powerful."
	ammo_type = list(/obj/item/ammo_casing/energy/emittergunborg)
	icon_state = "emittercannon"
	var/charge_cost = 750

/obj/item/gun/energy/emittercannon/emp_act(severity)
	return

/obj/item/borg/overdrive
	name = "Overdrive"
	icon = 'icons/obj/decals.dmi'
	icon_state = "shock"
