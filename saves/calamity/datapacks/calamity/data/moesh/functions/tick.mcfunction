# Called from: #minecraft:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Always tick these functions. Calls main game handlers. Sometimes a function is a single
#   line.
#---------------------------------------------------------------------------------------------------
# Any function here usually has it's own handling for lobby time and match time.

# Let's first check to see if any online player has left the game
execute as @a[scores={leaveGame=1..}] at @s run function moesh:player/left_game

# The functions below will handle players, no matter what state the game is in.
execute as @a[tag=!Registered] at @s run function moesh:player/reset
execute as @a[tag=!Registered] at @s run function moesh:player/enable_triggers
execute as @a[tag=!Registered] at @s run function moesh:player/refill_items_and_health
execute as @a[tag=!Registered] run tellraw @s {"translate":"%s Calamity by Moesh","color":"light_purple","with":[{"text":">>>","color":"white"}]}
tag @a[tag=!Registered] add Registered

# Resource points run every tick. When we establish game states, we'll be able to turn this on only
# when the game is running.
function moesh:resource_point/handler

# Convert end_stone item to cobblestone item.
execute as @e[type=item,nbt={Item:{id:"minecraft:end_stone"}}] run data merge entity @s {Item:{id:"minecraft:cobblestone"}}

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the lobby stage
#---------------------------------------------------------------------------------------------------

# This line below is for players who want to be cheeky. If they ever set a score for startMatch,
# go ahead and assume they want to start the match.
execute if score GameState gameVariable matches 0 run scoreboard players set @a[scores={startMatch=..-1}] startMatch 0
execute if score GameState gameVariable matches 0 run scoreboard players enable @a[scores={startMatch=0}] startMatch

# If a game is not starting, check to see if players want to start a game
execute as @a[scores={startMatch=1..}] at @s run function moesh:game_state/trigger_start_match

# If a game start is happening, check to see if players want to cancel it
execute as @a[scores={cancelStart=1..}] at @s run execute if score StartingMatch gameVariable matches 1 run function moesh:game_state/trigger_cancel_start

# Tick this every second if the players will it
execute if score GameState gameVariable matches 0 if score StartingMatch gameVariable matches 1 run function moesh:game_state/timer_start_match

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the match
#---------------------------------------------------------------------------------------------------

# Prevent players from leaving the play area
# TODO: execute as @a at @s unless entity @s[gamemode=spectator] if score GameState gameVariable matches 1 run function moesh:game_state/out_of_bounds

# This next line is essentially protection of players against themselves. They can use
# Let players run a GG command to end a game early
# /trigger set gg 0, therefore disabling the gg trigger for themselves.
execute if score GameState gameVariable matches 1 run scoreboard players set @a[scores={gg=..-1}] gg 0
execute if score GameState gameVariable matches 1 run scoreboard players enable @a[scores={gg=0}] gg
execute as @a[scores={gg=1..},limit=1,tag=Playing] at @s if score GameState gameVariable matches 1 run function moesh:game_state/trigger_gg

#---------------------------------------------------------------------------------------------------
# Purpose: Tick these functions during the post-game
#---------------------------------------------------------------------------------------------------

# This line below is for players who want to be cheeky. If they ever set a score for startMatch,
# go ahead and assume they want to start the match.
execute if score GameState gameVariable matches 2 run scoreboard players set @a[scores={reset=..-1}] reset 0
execute if score GameState gameVariable matches 2 run scoreboard players enable @a[scores={reset=0}] reset

# If a game is not starting, check to see if players want to start a game
execute as @a[scores={reset=1..}] at @s run function moesh:game_state/trigger_reset_game
