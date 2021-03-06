/obj/structure/closet/secure_closet/engineering_chief
	name = "chief engineer's locker"
	req_access = list(access_ce)
	icon_state = "securece1"
	icon_closed = "securece"
	icon_locked = "securece1"
	icon_opened = "secureceopen"
	icon_broken = "securecebroken"
	icon_off = "secureceoff"


	New()
		..()
		if(prob(50))
			new /obj/item/storage/backpack/industrial(src)
		else
			new /obj/item/storage/backpack/satchel_eng(src)
		if(prob(50))
			new /obj/item/storage/backpack/dufflebag/eng(src)
		if (prob(70))
			new /obj/item/clothing/accessory/storage/brown_vest(src)
		else
			new /obj/item/clothing/accessory/storage/webbing(src)
		new /obj/item/blueprints(src)
		new /obj/item/clothing/under/jumpsuit/hazard(src)
		new /obj/item/clothing/head/hardhat(src)
		new /obj/item/clothing/head/welding(src)
		new /obj/item/clothing/gloves/insulated(src)
		new /obj/item/clothing/shoes/brown(src)
		new /obj/item/cartridge/ce(src)
		new /obj/item/storage/toolbox/mechanical(src)
		new /obj/item/clothing/suit/storage/hazardvest(src)
		new /obj/item/clothing/mask/gas(src)
		new /obj/item/multitool(src)
		new /obj/item/flash(src)
		new /obj/item/taperoll/engineering(src)
		new /obj/item/crowbar/brace_jack(src)
		return



/obj/structure/closet/secure_closet/engineering_electrical
	name = "electrical supplies"
	req_access = list(access_engine_equip)
	icon_state = "secureengelec1"
	icon_closed = "secureengelec"
	icon_locked = "secureengelec1"
	icon_opened = "toolclosetopen"
	icon_broken = "secureengelecbroken"
	icon_off = "secureengelecoff"


	New()
		..()
		new /obj/item/clothing/gloves/insulated(src)
		new /obj/item/clothing/gloves/insulated(src)
		new /obj/item/storage/toolbox/electrical(src)
		new /obj/item/storage/toolbox/electrical(src)
		new /obj/item/storage/toolbox/electrical(src)
		new /obj/item/module/power_control(src)
		new /obj/item/module/power_control(src)
		new /obj/item/module/power_control(src)
		new /obj/item/multitool(src)
		new /obj/item/multitool(src)
		new /obj/item/multitool(src)
		return



/obj/structure/closet/secure_closet/engineering_welding
	name = "welding supplies"
	req_access = list(access_construction)
	icon_state = "secureengweld1"
	icon_closed = "secureengweld"
	icon_locked = "secureengweld1"
	icon_opened = "toolclosetopen"
	icon_broken = "secureengweldbroken"
	icon_off = "secureengweldoff"


	New()
		..()
		new /obj/item/clothing/head/welding(src)
		new /obj/item/clothing/head/welding(src)
		new /obj/item/clothing/head/welding(src)
		new /obj/item/weldingtool/largetank(src)
		new /obj/item/weldingtool/largetank(src)
		new /obj/item/weldingtool/largetank(src)
		new /obj/item/weldpack(src)
		new /obj/item/weldpack(src)
		new /obj/item/weldpack(src)
		return



/obj/structure/closet/secure_closet/engineering_personal
	name = "engineer's locker"
	req_access = list(access_engine_equip)
	icon_state = "secureeng1"
	icon_closed = "secureeng"
	icon_locked = "secureeng1"
	icon_opened = "secureengopen"
	icon_broken = "secureengbroken"
	icon_off = "secureengoff"


	New()
		..()
		if(prob(50))
			new /obj/item/storage/backpack/industrial(src)
		else
			new /obj/item/storage/backpack/satchel_eng(src)
		if(prob(50))
			new /obj/item/storage/backpack/dufflebag/eng(src)
		if (prob(70))
			new /obj/item/clothing/accessory/storage/brown_vest(src)
		else
			new /obj/item/clothing/accessory/storage/webbing(src)
		new /obj/item/storage/toolbox/mechanical(src)
		new /obj/item/clothing/suit/storage/hazardvest(src)
		new /obj/item/clothing/mask/gas(src)
		new /obj/item/clothing/glasses/meson(src)
		new /obj/item/cartridge/engineering(src)
		new /obj/item/taperoll/engineering(src)
		return
/obj/structure/closet/secure_closet/atmos_personal
	name = "technician's locker"
	req_access = list(access_atmospherics)
	icon_state = "secureatm1"
	icon_closed = "secureatm"
	icon_locked = "secureatm1"
	icon_opened = "secureatmopen"
	icon_broken = "secureatmbroken"
	icon_off = "secureatmoff"


	New()
		..()
		if(prob(50))
			new /obj/item/storage/backpack/industrial(src)
		else
			new /obj/item/storage/backpack/satchel_eng(src)
		if(prob(50))
			new /obj/item/storage/backpack/dufflebag/eng(src)
		if (prob(70))
			new /obj/item/clothing/accessory/storage/brown_vest(src)
		else
			new /obj/item/clothing/accessory/storage/webbing(src)
		new /obj/item/clothing/suit/fire(src)
		new /obj/item/flashlight(src)
		new /obj/item/extinguisher(src)
		new /obj/item/clothing/suit/storage/hazardvest(src)
		new /obj/item/clothing/mask/gas(src)
		new /obj/item/cartridge/atmos(src)
		new /obj/item/taperoll/atmos(src)
		return
