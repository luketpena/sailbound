function string_load_encrypted(path) {
	var key, file, file_len, str, byte, str_len, hash_str, hash_file;

	// keys for xor decryption from save script
	key[0] = $CA;
	key[1] = $4F;
	key[2] = $2C

	file = file_bin_open(path, 0); // open file
	file_len = file_bin_size(file); // get number of symbols in file
	str = ""; // create string for reading the file

	for (var i = 0; i < file_len; i++) { // for every symbol of file
		byte = file_bin_read_byte(file); // get byte
		byte ^= key[i mod 3]; // decrypt byte with one of three keys
		str += chr(byte); // add decrypted symbol to string
	}

	file_bin_close(file);

	str_len = string_length(str); // get number of symbols of string
	hash_str = string_copy(str, str_len-31, 32); // get hash of string
	str = string_delete(str, str_len-31, 32); // delete hash from string
	hash_file = md5_string_unicode(str); // get hash of file

	if (hash_str != hash_file) { // if hashes are not the same (that someone tryied to hack the file)
		show_message("Savegame File is Corrupted!"); // throw an error
		file_delete(path); // delete corrupted file
		exit; // exit form script
	}
	str = base64_decode(str); // if hashes are same and everything is ok, return string

	return str;
}


function string_save_encrypted(path, str) {
	var key, hash, str_len, file, byte;

	// Keys for xor encryption, first byte encrypted by first key, second by second, and so on. You can complicate encryption by adding new keys.
	// You also could wish to change default keys.
	key[0] = $CA; // must be from 1 to 255
	key[1] = $4F;
	key[2] = $2C

	str = base64_encode(str); // encode string with simple base64 for standardization
	hash = md5_string_unicode(str); // get hash of string (for tracking changes of file)
	str += hash; // add hash at the end of string
	str_len = string_length(str); // get number of symbols of string

	file = file_bin_open(path, 1) // create savefile
	for (var i = 0; i < str_len; i++) { // for every symbol of string
		byte = ord(string_char_at(str, i+1)); // get binary code of symbol
		byte ^= key[i mod 3]; // encode symbol with xor with one of three keys
		file_bin_write_byte(file, byte); // write byte in file
	}

	file_bin_close(file);
	
	return file_exists(path);
}
