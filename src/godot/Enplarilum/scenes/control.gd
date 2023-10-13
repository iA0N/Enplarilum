extends Control

var main
var drag_speed_modifier = 0.2
var drag_direction = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if (event is InputEventMultiScreenDrag or
		event is InputEventMultiScreenSwipe or
		event is InputEventMultiScreenTap or
		event is InputEventMultiScreenLongPress or
		event is InputEventSingleScreenDrag or
		event is InputEventScreenPinch or
		event is InputEventScreenTwist or
		event is InputEventSingleScreenTap or
		event is InputEventSingleScreenLongPress or
		event is InputEventSingleScreenTouch or
		event is InputEventSingleScreenSwipe or
		event is InputEventScreenCancel):
			pass
			
	if event is InputEventSingleScreenDrag:
		main.get_node("Camera3D").position.x += event.relative.x * drag_direction * drag_speed_modifier
		main.get_node("Camera3D").position.z += event.relative.y * drag_direction * drag_speed_modifier
