# Called from: calamity:game_state/tick_lobby

#>--------------------------------------------------------------------------------------------------
#> Purpose: A player has tried to use the /trigger arena command.
#>--------------------------------------------------------------------------------------------------

# If an arena was recently switched, continue the cooldown timer
execute if score ArenaSelectCooldown gameVariable matches 1.. run scoreboard players remove ArenaSelectCooldown gameVariable 1

# Check if the arena has been switched recently and is still on cooldown
execute if entity @a[scores={arena=1..},limit=1] if score ArenaSelectCooldown gameVariable matches 1.. run tellraw @a {"translate":"system.message","color": "red","with":[{"translate":"calamity.arena.error.cooldown"}]}
execute if entity @a[scores={arena=1..},limit=1] if score ArenaSelectCooldown gameVariable matches 1.. run scoreboard players reset @a arena
execute if entity @a[scores={arena=1..},limit=1] if score ArenaSelectCooldown gameVariable matches 1.. run scoreboard players enable @a arena

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
execute if score #selectedArena gameVariable matches 1.. run tellraw @a {"translate":"system.message","color":"green","with":[{"translate":"calamity.arena.loading"}]}
execute if score #selectedArena gameVariable matches 1.. run function calamity:arena/handler

# Switching arenas too quickly can cause a crash because of how many blocks are loading and
#   unloading. Let's limit this to every 5 seconds and advise the player.
execute if score #selectedArena gameVariable matches 1.. run scoreboard players set ArenaSelectCooldown gameVariable 60

# Calamity's arena makers must load and unload their own levels. The default action for the arena
#   handler is to load the level, so we will not need to define #actionAction gameVariable for
#   this action to run correctly.
# Load new blocks
execute if score #selectedArena gameVariable matches 1.. run scoreboard players operation #currentArena gameVariable = #selectedArena gameVariable
execute if score #selectedArena gameVariable matches 1.. run function calamity:arena/handler
# Send welcome message
execute if score #selectedArena gameVariable matches 1.. run scoreboard players set #arenaAction gameVariable 4
execute if score #selectedArena gameVariable matches 1.. run function calamity:arena/handler
# Handle players
execute if score #selectedArena gameVariable matches 1.. run execute as @a run function calamity:player/reset_data
execute if score #selectedArena gameVariable matches 1.. run execute as @a run function calamity:player/set_to_lobby_mode

# Always reset this variable
scoreboard players set #selectedArena gameVariable 0