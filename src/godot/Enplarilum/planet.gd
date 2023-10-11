extends MeshInstance3D

@export var direction = Vector3(0, 0, -30)
@export var speed = 2
var sunPosition = Vector3(0, 0, 0)
signal clicked(planet)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	self.rotate_y(deg_to_rad(1) * delta)
	var toSun = (sunPosition - self.position)
	var lenToSun = toSun.length()
	self.direction += (sunPosition - self.position) * delta * (1 - (lenToSun / 1000))
	#$p1.direction = $p1.direction.normalized() * 10
	self.direction.y = 0
	self.position += direction * speed * delta
	# self.direction *= (1 - (0.1 * delta)) friction


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		clicked.emit(self)
