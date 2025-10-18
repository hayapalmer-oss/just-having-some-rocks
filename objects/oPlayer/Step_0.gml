// the tilemap layer that we are using for platforms
var all_floor_bits = layer_get_all_elements("walls_and_floors");

var check_and_delete = function(layer_id) {
	show_debug_message(object_get_name(layer_id))
}

array_foreach(all_floor_bits, check_and_delete)

///////////
// MOVING X
///////////

// if we're walking in a direction
if (global.moving_right || global.moving_left) {

	// set the player walkspeed
	var player_speed = 0.0003;
	var direc = global.moving_right? 1 : (-1);

	// calculate size of step in x direc
	var step_size_x = player_speed * direc * delta_time;

	// make sure the space is empty and move x
	if (!place_meeting(x + step_size_x, y, all_floor_bits)) {
		// actually move
		x += step_size_x
	}
}

///////////
// MOVING Y
///////////

// calculate the size of step in y direc
var step_size_y = global.y_vel;
show_debug_message("velocity: {0}, acceleration: {1}", global.y_vel, global.y_acc)

// if there is nothing stopping the player's fall
if (!place_meeting(x, y + step_size_y, all_floor_bits)) {
	show_debug_message("enter falling")
	// move and change velocity by acceleratoin
	y += step_size_y;
	global.y_vel += global.y_acc;
	show_debug_message("falling")
} 

else {
	show_debug_message("enter grounding check")
	// if we would hit something, step down until we actually hit it.
	var full_step_y = 0;
	while (true) {
		if (!place_meeting(x, y + full_step_y, all_floor_bits)) full_step_y += 1;
		else break;
	}
	
	y += full_step_y - 1;
	show_debug_message("full_step_y: {0}", full_step_y)
}