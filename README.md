# Master Control for Game Maker Studio 2

Using this engine, you are able to very easily manage many controllers in a large game in an
initiation script or room start event in the beginning of game loading.

This system is comprised of 3 scripts: 

__mcs_add_controllers( room(s), controller(s) )__
This is the meat and potatoes of the whole system,
using this script you can add controllers to rooms by first specifying the room and the controller
that goes into it. 

You can also pass arrays of rooms/controllers into this script, for instance:

`mcs_add_controllers([rm_start,rm_lvl1,rm_lvl2], [con_ingame,con_init]);`

This example will add both of the controllers specified into all three rooms specified.

__mcs_auto_add(slug)__
This is a pretty neat script, you specify a "slug" or a string that is a word or phrase that is shared
across controllers and rooms and it will link them together.

For instance, let's say you have 2 controllers and 4 rooms, named as such:

Controllers
- con_jungle_main
- con_jungle_enemyspawn

Rooms
- rm_jungle_start
- rm_jungle_middle
- rm_jungle_end
- rm_jungle_secret

With the functioned used in the following way:
 
`mcs_auto_add("jungle");`

All of the controllers with "jungle" in the name will automatically be added to the rooms with "jungle"
in their names. 

__mcs_remove_controller(room, controller)__
Using this script, you can remove a single controller from a room. 