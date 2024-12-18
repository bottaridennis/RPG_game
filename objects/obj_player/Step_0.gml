right_key = keyboard_check(vk_right) || keyboard_check(ord("D"));
left_key = keyboard_check(vk_left) || keyboard_check(ord("A"));
up_key = keyboard_check(vk_up) || keyboard_check(ord("W"));
down_key = keyboard_check(vk_down) || keyboard_check(ord("S"));

xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;

mask_index = sprite[DOWN];

if yspd == 0
{
	if xspd > 0 {face = RIGHT}
	if xspd < 0 {face = LEFT}
}

if xspd > 0 && face == LEFT {face = RIGHT};
if xspd < 0 && face == RIGHT {face = LEFT};

if xspd == 0
{
	if yspd < 0 {face = DOWN}
	if yspd > 0 {face = UP}
}

if yspd > 0 && face == DOWN {face = UP};
if yspd < 0 && face == UP {face = DOWN};

sprite_index = sprite[face];

if place_meeting(x + xspd, y, obj_wall) == true {xspd = 0;}
if place_meeting(x, y + yspd, obj_wall) == true {yspd = 0;}

x += xspd;
y += yspd;

if xspd == 0 && yspd == 0 { image_index = 0; }