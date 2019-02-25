# Master Control for Game Maker Studio 2

Using this engine, you are able to very easily manage many controllers in a large game in an
initiation script or room start event in the beginning of game loading.

When a controller is added to a room, the controller with have an instance of it created at room start.

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

With the script used in the following way:
 
`mcs_auto_add("jungle");`

All of the controllers with "jungle" in the name will automatically be added to the rooms with "jungle"
in their names. 

__mcs_remove_controller(room, controller)__
Using this script, you can remove a single controller from a room. 

## More Info


__Video Tutorial__
<a href="http://www.youtube.com/watch?feature=player_embedded&v=YOUTUBE_VIDEO_ID_HERE
" target="_blank"><img src="http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>

__Marketplace Listing__
[View Listing](https://www.google.com)

__Code on Pastebin__
[View on Pastebin](https://www.google.com)