extends Node3D

var xr_interface: XRInterface

func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		if xr_interface.initialize():
			if xr_interface.is_passthrough_supported():
				get_viewport().transparent_bg = true
				print(xr_interface.start_passthrough())
			get_viewport().use_xr = true
	else:
		print("OpenXR not initialized, please check if your headset is connected")
