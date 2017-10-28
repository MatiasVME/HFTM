extends CanvasLayer

onready var animation_inventory = $AnimationInventory
onready var animation_stats = $AnimationStats

#onready var inventory = $Inventory
#onready var stats = $Stats

var inventory_show = false
var stats_show = false

func _ready():
	set_process_input(true)
	
func _input(event):	
	if event.is_action_pressed("inventory") and not animation_inventory.is_playing():
		if not inventory_show:
			inventory_show = true
			animation_inventory.play("inventory_show")
		else:
			inventory_show = false
			animation_inventory.play("inventory_hide")
	if event.is_action_pressed("stats") and not animation_stats.is_playing():
		if not stats_show:
			stats_show = true
			animation_stats.play("stats_show")
		else:
			stats_show = false
			animation_stats.play("stats_hide")
	