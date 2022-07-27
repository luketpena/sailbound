function sys_init() {
	if (instance_number(system) = 0) {
		var sys = instance_create_layer(0, 0, "l_system", system);
		switch (os_type) {
			case os_windows:
			case os_macosx:
			case os_linux:
				sys.osType = OsType.Desktop;
				break;

			case os_android:
			case os_ios:
				sys.osType = OsType.Mobile;
				break;
		}

		instance_create_layer(0 ,0, "l_system", settings);
		instance_create_layer(0, 0, "l_system", clock);
		instance_create_layer(0, 0, "l_system", colors);
		instance_create_layer(0, 0, "l_system", sys_town);
	}
}

function platform_init() {
	if (!instance_exists(sys_town)) {
		instance_create_layer(0, 0, "l_system", sys_town);
	}
}
