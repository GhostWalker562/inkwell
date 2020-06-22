extends Sprite

###############################\

## THANKS FOR USING MY ASSET

## I'VE SPENT A LOT OF TIME WORKING ON THIS ASSET

## IF YOU WOULD LIKE TO DONATE,

## THAT WOULD BE GREATLY APPRECIATED

## https://www.paypal.me/Moonsdontburn

## THANKS, AND HAVE A GREAT DAY!

###############################/

var tween : Tween;
var parent_button : Button;

## GET NODES
func _ready():
	tween = $Tween;
	parent_button = get_node("..");

## RESPONSIVE SIZING
func _process(_dlt):
	var text_size: Vector2 = texture.get_size()
	
	# moves the sprite to the CENTER of the button
	position = parent_button.rect_size/2
	
	# scales the sprite to be AS BIG as the button
	scale = parent_button.rect_size/text_size

## LOGIC
func _input(event):
	if ( event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed):
		 
		var text_size: Vector2 = texture.get_size()
		
		# normalizes the local_mouse position
		var local_mouse : Vector2 = get_local_mouse_position()
		local_mouse.x += text_size.x / 2;
		local_mouse.y += text_size.y / 2;

		# checks for cursor and whether it is inside the button bounds
		if !(local_mouse.x <= text_size.x && local_mouse.y <= text_size.y):
			return
		if !(local_mouse.x >= 0 && local_mouse.y >=0):
			return
		
		# normalizes the local_mouse position on a UV
		local_mouse.x /= text_size.x
		local_mouse.y /=  text_size.y
		
		# applies the position and runs the animation IF the tween has not done so recently
		if !(tween.is_active()):
			material.set_shader_param("circle_offset", local_mouse)
# warning-ignore:return_value_discarded
			tween.interpolate_property(material, "shader_param/time", -0.25, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
# warning-ignore:return_value_discarded
			tween.start()
