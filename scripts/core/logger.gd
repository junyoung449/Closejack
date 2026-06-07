extends Node

enum Level { DEBUG, INFO, WARN, ERROR, NONE }

var _min_level: Level = Level.DEBUG


func set_level(level: Level) -> void:
	_min_level = level


func debug(msg: String) -> void:
	if _min_level <= Level.DEBUG:
		print_rich("[color=gray][DEBUG] %s[/color]" % msg)


func info(msg: String) -> void:
	if _min_level <= Level.INFO:
		print_rich("[color=cyan][INFO]  %s[/color]" % msg)


func warn(msg: String) -> void:
	if _min_level <= Level.WARN:
		push_warning(msg)
		print_rich("[color=yellow][WARN]  %s[/color]" % msg)


func error(msg: String) -> void:
	if _min_level <= Level.ERROR:
		push_error(msg)
		print_rich("[color=red][ERROR] %s[/color]" % msg)
