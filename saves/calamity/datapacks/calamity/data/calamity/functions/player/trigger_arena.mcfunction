# Called from: calamity:game_state/handler

#---------------------------------------------------------------------------------------------------
# Purpose: A player has tried to use the /trigger arena command.
#---------------------------------------------------------------------------------------------------

# Select Calamity Modern arena
execute as @a[scores={arena=1}] run function calamity:arena/calamity/load_blocks
execute as @a[scores={arena=1}] run function calamity:arena/calamity/set_arena_rules
execute as @a[scores={arena=1}] run function calamity:arena/calamity/send_welcome_message

# Select Shattering arena
execute as @a[scores={arena=2}] run function calamity:arena/shattered/load_blocks
#execute as @a[scores={arena=2}] run function calamity:arena/shattered/set_arena_rules
#execute as @a[scores={arena=2}] run function calamity:arena/shattered/send_welcome_message

# Select Something arena
#execute as @a[scores={arena=3}] run function calamity:arena/something/load_blocks
#execute as @a[scores={arena=3}] run function calamity:arena/something/set_arena_rules
#execute as @a[scores={arena=3}] run function calamity:arena/something/send_welcome_message


# Always reset all players
execute as @a[scores={arena=1..}] run function calamity:player/set_to_lobby_mode

# Always enable triggers
scoreboard players reset @a arena
scoreboard players enable @a arena