switch (os_type)
{
	case os_windows:
	case os_macosx:
	case os_linux:
		osType = OsType.Desktop;
		break;

	case os_android:
	case os_ios:
		osType = OsType.Mobile;
		break;
}

instance_create_layer(0,0,"l_system",settings);
instance_create_layer(0,0,"l_system",sys_testControls);
instance_create_layer(0,0,l_system,sys_clock);