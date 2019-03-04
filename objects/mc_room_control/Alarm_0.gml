/// @description Insert description here
// You can write your code in this editor
var instances = "\n======\n";
for( i = 0; i <= 50; i++ ){
	if( instance_exists(i) ){
		instances += object_get_name(i.object_index) + "\n";
	}
}

show_message(room_get_name(room) + instances); 
