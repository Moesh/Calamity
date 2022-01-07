# Called from: #calamity:register_player, calamity:player/trigger/reset_game

#>--------------------------------------------------------------------------------------------------
#> Purpose: Returns players to their initial state at the start of the map (lobby, not match)
#   This function MUST NOT affect the player's team or position.
#>--------------------------------------------------------------------------------------------------

# Tags
tag @s remove Playing
tag @s remove VotedForfeit

# Clear player of their blessings
clear @s
xp set @s 0 levels
xp set @s 0 points
scoreboard players set @s kills 0
scoreboard players set @s streakPoints 0
scoreboard players set @s streakLevel 0
scoreboard players set @s nextStreakLevel 0
team leave @s

effect clear @s
# Give status effects
# Register player in the food scoreboard
effect give @a minecraft:hunger 1 100 true
effect give @s minecraft:instant_health 3 10 true
effect give @s minecraft:regeneration 3 10 false

# Update the player sessionID to match current SessionID
scoreboard players operation @s sessionID = SessionID gameVariable