extends Node3D

@onready var sunPosition = $sun.position
var tracked_planet = {"tracking": false, "planet": null}
var enemy_scene = load("res://enemy.tscn")
var default_cam_position = Vector3(0, 112, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("p1").clicked.connect(clicked_planet)
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

func spawn_enemies():
	while true:
		var pos = Vector3(randf() * 2 - 1, 0, randf() * 2 - 1)
		pos = pos.normalized() * 200
		var e = enemy_scene.instantiate()
		self.add_child(e)
		e.position = pos
		await get_tree().create_timer(0.1).timeout
