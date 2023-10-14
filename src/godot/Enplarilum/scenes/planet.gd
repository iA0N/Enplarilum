extends Node3D

@export var direction = Vector3(0, 0, 0)
@export var speed = 0
var sunPosition = Vector3(0, 0, 0)
signal clicked(planet)


func init(pos, dir, sp):
	self.position = pos
	self.direction = dir
	self.speed = sp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	self.rotate_y(deg_to_rad(10) * delta)
	self.rotate_x(deg_to_rad(10) * delta)
	var toSun = (sunPosition - self.position)
	var lenToSun = toSun.length()
	self.direction += toSun * delta
	#$p1.direction = $p1.direction.normalized() * 10
	self.direction.y = 0
	self.position += direction * speed * delta
	# self.direction *= (1 - (0.1 * delta)) friction


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		clicked.emit(self)
