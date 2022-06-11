#/*************************************************************************/#
#/*  Created by Andrew Poženel, 2022                                      */#
#/*************************************************************************/#

extends Control

onready var bg = $background
onready var au = $audio
var time = OS.get_time(false)
var hour = time.hour
var minute = time.minute
var second = time.second
var datetime = OS.get_datetime(false)
onready var tl = $buttons/TextureButton/timeLBL


func _ready() -> void:
	StartupAudio()
	ShuffleWallpapers()
	#CalculateCurrentDateTime()

func _exit_tree() -> void:
	ShutdownAudio()


func ShuffleWallpapers():

	randomize()

	var wallpapers = [
				preload('res://data/media/wallpapers/Ascent.jpg'),
				preload('res://data/media/wallpapers/Autumn.jpg'),
				preload('res://data/media/wallpapers/Azul.jpg'),
				preload('res://data/media/wallpapers/Bliss.jpg'),
				preload('res://data/media/wallpapers/Blue hills.jpg'),
				preload('res://data/media/wallpapers/Crystal.jpg'),
				preload('res://data/media/wallpapers/Follow.jpg'),
				preload('res://data/media/wallpapers/Friend.jpg'),
				preload('res://data/media/wallpapers/Home.jpg'),
				preload('res://data/media/wallpapers/Moon flower.jpg'),
				preload('res://data/media/wallpapers/Peace.jpg'),
				preload('res://data/media/wallpapers/Power.jpg'),
				preload('res://data/media/wallpapers/Purple flower.jpg'),
				preload('res://data/media/wallpapers/Radiance.jpg'),
				preload('res://data/media/wallpapers/Red moon desert.jpg'),
				preload('res://data/media/wallpapers/Ripple.jpg'),
				preload('res://data/media/wallpapers/Stonehenge.jpg'),
				preload('res://data/media/wallpapers/Sunset.jpg'),
				preload('res://data/media/wallpapers/Tulips.jpg'),
				preload('res://data/media/wallpapers/Vortec space.jpg'),
				preload('res://data/media/wallpapers/Water lilies.jpg'),
				preload('res://data/media/wallpapers/Wind.jpg'),
				preload('res://data/media/wallpapers/Windows XP.bmp'),
				preload('res://data/media/wallpapers/Winter.jpg'),
				]


	randomize()

	for wallpaper in wallpapers:
		bg.set_texture(wallpapers[round(rand_range(0,23))])



		#bg.set_texture(wallpapers[round(rand_range(0,23))])

	#	for wallpaper in wallpapers:
	#
	#		randomize()
	#		wallpapers[randi() % wallpapers.size()]
	#
	#		bg.set_texture(wallpaper)
	#		randomize()


func StartupAudio():
	au.autoplay = false
	au.set_stream(preload('res://data/media/Windows XP Startup.wav'))
	au.play()

	print("Start time: ")
	print(String(time.hour) +":"+String(time.minute)+":"+String(time.second))

func ShutdownAudio():
	au.autoplay = false
	au.set_stream(preload('res://data/media/Windows XP Shutdown.wav'))
	au.play()

	print("Shutdown time: ")
	print(String(time.hour) +":"+String(time.minute)+":"+String(time.second))

#func CalculateCurrentDateTime():
#
#	print(datetime)
#	print(time)
#
#	tl.set_text(String(time.hour) +":"+String(time.minute)+":"+String(time.second))
#
#	pass



func _on_Timer_timeout() -> void:
	get_tree().change_scene("res://ShuttingDown.tscn")


func _on_Button_pressed() -> void:

	$buttons/TextureButton/desktop_icons/Msgbox.set_visible(true)


func _on_OK_pressed() -> void:
	get_tree().change_scene("res://ShuttingDown.tscn")


func _on_X_pressed() -> void:

	$buttons/TextureButton/desktop_icons/Msgbox/X/Bsod.visible = true
	$buttons/TextureButton/desktop_icons/Msgbox/X/Timer_X.start(7)


func _on_Timer_X_timeout() -> void:
	get_tree().quit()


func _on_Button_mouse_entered() -> void:
	hint_tooltip = "Network connection"


func _on_ButtonAU_mouse_entered() -> void:
	hint_tooltip = "Volume"


func _on_ButtonHW_mouse_entered() -> void:
	hint_tooltip = "Eject device"


func _on_ButtonSEC_mouse_entered() -> void:
	hint_tooltip = "Unresolved actions require your attention!"


func _on_timeLBL_mouse_entered() -> void:
	hint_tooltip = "Time"
