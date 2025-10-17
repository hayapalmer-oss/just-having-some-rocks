// if we're not walking, we don't care
if (!(global.moving_right || global.moving_left)) return;

// set the player walkspeed
var player_speed = 0.0002;
var direc = global.moving_right? 1 : (-1)

show_debug_message("direction: {0, player_speed * direc: {1}}", direc, player_speed * direc)
x += player_speed * direc * delta_time