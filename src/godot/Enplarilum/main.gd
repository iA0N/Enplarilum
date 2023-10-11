extends Node3D

@onready var sunPosition = $sun.position
var tracked_planet = {"tracking": false, "planet": null}
var default_cam_position = Vector3(0, 112, 0)
var planets = []

# load scenes
var enemy_scene = load("res://scenes/enemy.tscn")
var planet_scene = load("res://scenes/planet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_planet(Vector3(-100, 0, 0), Vector3(0, 0, 80), 0.25)
	spawn_enemies()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if tracked_planet["tracking"] == false:
		return

	$Camera3D.position.y = 40
	$Camera3D.position.x = tracked_planet["planet"].position.x
	$Camera3D.position.z = tracked_planet["planet"].position.z
		
	
func clicked_planet(planet):
	tracked_planet["planet"] = planet
	tracked_planet["tracking"] = true

func _input(event):
	if event.is_action_released("ui_cancel"):
		tracked_planet["tracking"] = false
		$Camera3D.position = default_cam_position
		
	if event is InputEventScreenPinch:
		$Camera3D.position.y -= sign(event.relative)
		
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
			$UI/user_input.text = event.as_string()
			print(event.as_string())


func spawn_enemies():
	while true:
		var pos = Vector3(randf() * 2 - 1, 0, randf() * 2 - 1)
		pos = pos.normalized() * 200
		var e = enemy_scene.instantiate()
		self.add_child(e)
		e.position = pos
		await get_tree().create_timer(0.1).timeout
		
func spawn_planet(pos, dir, sp):
	var new_planet = planet_scene.instantiate()
	new_planet.init(pos, dir, sp)
	new_planet.clicked.connect(clicked_planet)
	self.add_child(new_planet)
