/obj/item/stack/tape_roll
	name = "tape roll"
	desc = "A roll of sticky tape. Possibly for taping ducks... or was that ducts?"
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "taperoll"
	singular_name = "tape roll"
	w_class = WEIGHT_CLASS_TINY
	full_w_class = WEIGHT_CLASS_TINY
	amount = 25
	max_amount = 25


/obj/item/stack/tape_roll/attack(mob/living/carbon/human/M, mob/living/user)
	if(!istype(M)) //What good is a duct tape mask if you are unable to speak?
		return
	if(M.wear_mask)
		to_chat(user, "Remove [M.p_their()] mask first!")
		return
	if(amount < 2)
		to_chat(user, "You'll need more tape for this!")
		return
	if(!M.check_has_mouth())
		to_chat(user, "[M.p_they(TRUE)] [M.p_have()] no mouth to tape over!")
		return
	user.visible_message("<span class='warning'>[user] is taping [M]'s mouth closed!</span>",
	"<span class='notice'>You try to tape [M == user ? "your own" : "[M]'s"] mouth shut!</span>",
	"<span class='warning'>You hear tape ripping.</span>")
	if(!do_after(user, 5 SECONDS, M))
		return
	if(!use(2))
		to_chat(user, "<span class='notice'>You don't have enough tape!</span>")
		return
	if(M.wear_mask)
		to_chat(user, "<span class='notice'>[M == user ? user : M]'s mouth is already covered!</span>")
		return
	user.visible_message("<span class='warning'>[user] tapes [M]'s mouth shut!</span>",
	"<span class='notice'>You cover [M == user ? "your own" : "[M]'s"] mouth with a piece of duct tape.[M == user ? null : " That will shut them up."]</span>")
	var/obj/item/clothing/mask/muzzle/G = new /obj/item/clothing/mask/muzzle/tapegag
	M.equip_to_slot_if_possible(G, ITEM_SLOT_MASK)
	G.add_fingerprint(user)


/obj/item/stack/tape_roll/update_icon_state()
	var/amount = get_amount()
	if((amount <= 2) && (amount > 0))
		icon_state = "[initial(icon_state)]"
	if((amount <= 4) && (amount > 2))
		icon_state = "[initial(icon_state)]2"
	if((amount <= 6) && (amount > 4))
		icon_state = "[initial(icon_state)]3"
	if((amount > 6))
		icon_state = "[initial(icon_state)]4"
	else
		icon_state = "[initial(icon_state)]4"


/obj/item/stack/tape_roll/thick
	name = "incredibly thick tape roll"
	desc = "Incredibly thick duct tape, suspiciously black in appearance. It is quite uncomfortable to hold it as it sticks to your hands."
	icon_state = "thick_taperoll"
	singular_name = "incridibly dence tape roll"
	amount = 40
	max_amount = 40

/obj/item/stack/tape_roll/thick/attack(mob/living/carbon/human/M, mob/living/user)
	if(!istype(M)) //What good is a duct tape mask if you are unable to speak?
		return
	if(amount < 2)
		to_chat(user, "You'll need more tape for this!")
		return
	if(!M.check_has_mouth())
		to_chat(user, "[M.p_they(TRUE)] [M.p_have()] no mouth to tape over!")
		return
	user.visible_message("<span class='warning'>[user] is taping [M]'s mouth closed!</span>",
	"<span class='notice'>You try to tape [M == user ? "your own" : "[M]'s"] mouth shut!</span>",
	"<span class='warning'>You hear tape ripping.</span>")
	if(!do_after(user, 1 SECONDS, M))
		return
	if(!use(2))
		to_chat(user, "<span class='notice'>You don't have enough tape!</span>")
		return
	if(M.wear_mask)
		var/obj/item/clothing/mask = M.wear_mask
		M.drop_item_ground(mask)
	user.visible_message("<span class='warning'>[user] tapes [M]'s mouth shut!</span>",
	"<span class='notice'>You cover [M == user ? "your own" : "[M]'s"] mouth with a piece of duct tape.[M == user ? null : " That will shut them up."]</span>")
	var/obj/item/clothing/mask/muzzle/G = new /obj/item/clothing/mask/muzzle/tapegag/thick
	M.equip_to_slot_if_possible(G, ITEM_SLOT_MASK)
	G.add_fingerprint(user)

