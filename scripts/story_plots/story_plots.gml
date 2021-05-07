/*
	Things a plot needs to execute so far:
		- createChaptersArray with an array of chapters
		- set the storye
*/

///@param GameMode
function plot_tropicalParadise(_gameMode) {
	story_set_gameMode(_gameMode);
	story_set_chapters([
		new Chapter(30, null, null, ChapterStartDeclaration, ChapterEndDeclaration, IslandType.Tropical, [.5, 3], null),
		new Chapter(30, null, null, ChapterStartDeclaration, ChapterEndDeclaration, IslandType.Tropical, [.5, 3], [5, 10]),
		new Chapter(30, null, null, ChapterStartDeclaration, ChapterEndDeclaration, null, null, null),
	]);
	story_set_level(Level.Tropical);
	story_start();
}

