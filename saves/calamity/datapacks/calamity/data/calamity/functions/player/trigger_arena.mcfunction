# Called from: calamity:game_state/handler

#---------------------------------------------------------------------------------------------------
# Purpose: A player has tried to use the /trigger arena command.
#---------------------------------------------------------------------------------------------------

# #selectedArena gameVariable 0
# #currentArena gameVariable 0

# If the #currentArena gameVariable matches trigger number, the current arena is already selected.
#   Advise the player that they've made a mistake
execute if score @a[scores={arena=1..},limit=1] arena = #currentArena gameVariable run tellraw @a[scores={arena=1..}] {"translate":"system.message","color":"red","with":[{"translate": "calamity.arena.error.sameArena"}]}
execute if score @a[scores={arena=1..},limit=1] arena = #currentArena gameVariable run scoreboard players reset @a arena
# Pass the variable from the player to our system.
scoreboard players operation #selectedArena gameVariable = @a[scores={arena=1..},limit=1] arena
# We're done with the player now. Always enable triggers.
scoreboard players reset @a arena
scoreboard players enable @a arena

# We have determined that a new level has been selected, let's erase the old level. When an arena
#   is loaded, it #currentArena gameVariable, so we already know what the current level is. Arena
#   handler has a special action which handles this. Let's call it and then move onto loading the
#   level.
execute if score #selectedArena gameVariable matches 1.. run scoreboard players set #arenaAction gameVariable 1
execute if score #selectedArena gameVariable matches 1.. run function calamity:arena/handler

# Calamity's arena makers must load and unload their own levels. The default action for the arena
#   handler is to load the level, so we will not need to define #actionAction gameVariable for
#   this action to run correctly.
execute if score #selectedArena gameVariable matches 1.. run scoreboard players operation #currentArena gameVariable = #selectedArena gameVariable
execute if score #selectedArena gameVariable matches 1.. run function calamity:arena/handler
execute if score #selectedArena gameVariable matches 1.. run execute as @a run function calamity:player/set_to_lobby_mode

scoreboard players set #selectedArena gameVariable 0
# Cases
# - Player selects current arena:
#   - Send message: No action can be taken, arena already selected
#   - Exit
# - Player selects another arena:
#   - Pass trigger variable to #NewArenaSelection gameVariable
#   - Run arena handler to erase current arena
#   - Erase current arena
#   - Load new arena
#   - Reset players to new lobby location

