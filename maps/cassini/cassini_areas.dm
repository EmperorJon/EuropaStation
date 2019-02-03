/world

	//Some places in the codebase revert turfs to area base, some to map base, and some to world base :(
	//By default we'll make dry ocean floor the base floor type to prevent mad flooding by magically appearing water
	//It's up to areas etc. to override this where it makes sense to do so.
	turf = /turf/simulated/ocean/dry

/area/space/ocean
	name = "open ocean"
	icon_state = "ocean"
	icon = 'maps/cassini/icons/areas.dmi'
	base_turf = /turf/simulated/ocean

/area/cassini
	name = "Cassini"
	icon_state = "cassini"
	icon = 'maps/cassini/icons/areas.dmi'
	base_turf = /turf/simulated/ocean/dry

////////
//ROCK// These are the various mine/rock areas
////////

/area/cassini/rock/
	name = "Rock"
	icon_state = "rock"
	icon = 'maps/cassini/icons/areas.dmi'
	requires_power = 1
	always_unpowered = 1
	dynamic_lighting = 1
	power_light = 0
	power_equip = 0
	power_environ = 0
	area_flags = AREA_FLAG_IS_NOT_PERSISTENT
	base_turf = /turf/simulated/ocean/dry

////////////
//HALLWAYS// These are the only areas required by unit tests to have scrubbers/vents, as we're not a space map, so we don't need atmos everywhere.
////////////

/area/cassini/hallway
	name = "Do Not Use"
	icon_state = "empty"
	icon = 'maps/cassini/icons/areas.dmi'
	base_turf = /turf/simulated/ocean/dry

/area/cassini/hallway/basement_main
	name = "Main Basement Hallway"
	icon_state = "hallway_basement_main"

/area/cassini/hallway/basement_west
	name = "West Basement Hallway"
	icon_state = "hallway_basement_west"

/area/cassini/hallway/basement_south
	name = "Engineering Hallway"
	icon_state = "hallway_basement_south"

/area/cassini/hallway/basement_east
	name = "East Basement Hallway"
	icon_state = "hallway_basement_east"

/area/cassini/hallway/basement_nw
	name = "Partial Basement Hallway"
	icon_state = "hallway_basement_nw"

/area/cassini/hallway/basement_se
	name = "East Engineering Hallway"
	icon_state = "hallway_basement_se"

//////////
//PUBLIC// These are rooms which are generally open to access for anyone
//////////

/area/cassini/public
	name = "Do Not Use"
	icon_state = "empty"
	icon = 'maps/cassini/icons/areas.dmi'
	base_turf = /turf/simulated/ocean/dry

/area/cassini/public/refuge
	name = "Emergency Refuge"
	icon_state = "public_basement_refuge"

/area/cassini/public/basement_emergency_supplies
	name = "Basement Emergency Supplies"
	icon_state = "public_basement_emergency"

/area/cassini/public/basement_construction_site
	name = "Basement Construction Site"
	icon_state = "public_basement_construction_site"

///////////
//PRIVATE// These are areas which are owned by someone other than Cassini
///////////

/area/cassini/private
	name = "Do Not Use"
	icon_state = "empty"
	icon = 'maps/cassini/icons/areas.dmi'
	base_turf = /turf/simulated/ocean/dry

/area/cassini/private/mine_office
	name = "Corporate Mining Office"
	icon_state = "mine_office"

///////////////
//MAINTENANCE// Maintenance levels with the usual maintenance settings
///////////////

/area/cassini/maintenance
	name = "Do Not Use"
	icon_state = "empty"
	icon = 'maps/cassini/icons/areas.dmi'
	base_turf = /turf/simulated/ocean/dry

/area/cassini/maintenance/engineering_inner
	name = "East Engineering Maintenance"
	icon_state = "empty"

/area/cassini/maintenance/engineering_outer
	name = "West Engineering Maintenance"
	icon_state = "empty"

/area/cassini/maintenance/utilshaft
	name = "Utility Shaft Access"
	icon_state = "util_shaft"

/area/cassini/maintenance/atmos
	name = "Climate Control Maintenance"
	icon_state = "empty"

/area/cassini/maintenance/elevator
	name = "Elevator Maintenance"
	icon_state = "empty"

/area/cassini/maintenance/private
	name = "Private Mine Maintenance"
	icon_state = "empty"

/area/cassini/maintenance/refuge
	name = "Refuge Maintenance"
	icon_state = "empty"

/area/cassini/maintenance/reactor
	name = "Reactor Cavern Side Entry"
	icon_state = "empty"

///////////////
//ENGINEERING// These are areas on the engineering Z-level
///////////////

/area/cassini/engineering
	name = "Do Not Use"
	icon_state = "empty"
	icon = 'maps/cassini/icons/areas.dmi'
	base_turf = /turf/simulated/ocean/dry

/area/cassini/engineering/core
	name = "R-UST Core"
	icon_state = "reactor_core"

/area/cassini/engineering/exterior
	name = "R-UST Exterior"
	icon_state = "reactor_exterior"

/area/cassini/engineering/reactor_bath
	name = "Control Room Bathroom"
	icon_state = "reactor_bathroom"

/area/cassini/engineering/reactor_break
	name = "Control Room Breakroom"
	icon_state = "reactor_breakroom"

/area/cassini/engineering/control
	name = "R-UST Control Room"
	icon_state = "reactor_control"

/area/cassini/engineering/office
	name = "Engineering Office"
	icon_state = "engineering_office"

/area/cassini/engineering/lockers
	name = "Engineering Locker Room"
	icon_state = "engineering_lockers"

/area/cassini/engineering/bathroom
	name = "Engineering Bathroom"
	icon_state = "engineering_bathroom"

/area/cassini/engineering/lobby
	name = "Engineering Lobby"
	icon_state = "engineering_lobby"

/area/cassini/engineering/tools
	name = "Engineering Tool Storage"
	icon_state = "engineering_tools"

/area/cassini/engineering/machine
	name = "Engineering Machine Storage"
	icon_state = "engineering_machines"

/area/cassini/engineering/supply
	name = "Engineering Supply Storage"
	icon_state = "engineering_supplies"

/area/cassini/engineering/atmos
	name = "Climate Control"
	icon_state = "engineering_atmos"

/area/cassini/engineering/breakroom
	name = "Engineering Breakroom"
	icon_state = "engineering_breakroom"

/area/cassini/engineering/suits
	name = "Engineering Suit Storage"
	icon_state = "engineering_suits"

/area/cassini/engineering/tech
	name = "Engineering Tech Storage"
	icon_state = "engineering_tech"

/area/cassini/engineering/smes
	name = "Engineering Power Control"
	icon_state = "engineering_power"