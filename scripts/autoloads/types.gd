extends Object

# This autoloaded script is meant to contain shared type definitions like enums.

# Enum representing the various "levels" (scenes) of the game.
enum Level {
	None, # "Null" value, when level is defined as 'Types.None' it will evaluate to false in if statements.
	City,
	Shop1,
}

# Constants representing the various spawn locations.
const DEFAULT_SPAWN = "default"
const INITIAL_SPAWN = "initial"
const SHOP_SPAWN = "shop"
