extends Node

###############################\

## THANKS FOR USING MY ASSET

## I'VE SPENT A LOT OF TIME WORKING ON THIS ASSET

## IF YOU WOULD LIKE TO DONATE,

## THAT WOULD BE GREATLY APPRECIATED

## https://www.paypal.me/Moonsdontburn

## THANKS, AND HAVE A GREAT DAY!

###############################/

###############################\

## INSTRUCTIONS

## 1. ATTACH THE NODE ONTO ANY BUTTON
## IF THIS SCENE IS NOT ATTACHED TO A BUTTON
## AN ERROR WILL OCCUR

## 2. EDIT PARAMS

## 3. CLICK ON THE BUTTON TO GET AN
## INKWELL EFFECT

###############################/

export(float, -2, 2) var size_speed= 0.25;
export(float, 1, 5) var fade_speed = 1;
export(Texture) var gradient = null;
export(bool) var fade = true;
export(bool) var loop = false;

func _enter_tree():
	var tscn : Sprite = preload("res://addons/InkWell/InkWellNode/NodeScene.tscn").instance();
	get_parent().call_deferred("add_child",tscn);
	
	# Set params
	var mat = tscn.material
	mat.set_shader_param("size_speed", size_speed)
	mat.set_shader_param("fade_speed", fade_speed)
	if (gradient != null):
		mat.set_shader_param("gradient", gradient)
	mat.set_shader_param("fade", fade)
	mat.set_shader_param("loop", loop)
