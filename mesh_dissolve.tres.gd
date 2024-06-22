extends MeshInstance3D

var dissolve_amount = 0.0
var dissolve_speed = 0.5
var dissolve_material: ShaderMaterial

var tween: Tween


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dissolve_material = material_override as ShaderMaterial
	dissolve_material.set_shader_parameter("dissolve_amount", 0.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_down"):
		trigger_dissolve()


func trigger_dissolve() -> void:
	if tween:
		return
	
	tween = create_tween()
	tween.tween_property(dissolve_material, "shader_parameter/dissolve_amount", 1.0, dissolve_speed)
	tween.tween_callback(on_dissolve_complete)
	
	
func on_dissolve_complete() -> void:
	queue_free()
	
	
	
	
	
