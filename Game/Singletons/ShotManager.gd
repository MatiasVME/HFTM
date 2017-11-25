extends Node

onready var timer = $Ticks

var player_can_fire = true
var enemy_can_fire = true

var wait = 0 # Tiempo a esperar
var acum_wait = 0 # Tiempo esperado acumulado

func fire(wait_ticks):
	wait = wait_ticks * timer.get_wait_time()
	player_can_fire = false

func enemyfire(wait_ticks):
	wait = wait_ticks * timer.get_wait_time()
	enemy_can_fire = false

func _on_Ticks_timeout():
	acum_wait += timer.get_wait_time()
	
	if acum_wait >= wait:
		player_can_fire = true
		enemy_can_fire = true
		acum_wait = 0