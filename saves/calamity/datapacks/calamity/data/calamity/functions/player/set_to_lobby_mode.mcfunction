# Called from: #calamity:reset

#---------------------------------------------------------------------------------------------------
# Purpose: Set the player to the lobby state
#---------------------------------------------------------------------------------------------------
teleport @s 136 57 65 0 0
spawnpoint @s 136 57 65
gamemode adventure @s[gamemode=!adventure]
function calamity:player/give_lobby_effects