# Called from: calamity:trigger_start_match

#---------------------------------------------------------------------------------------------------
# Purpose: TimeInTicks from 15 seconds and then start the match.
#---------------------------------------------------------------------------------------------------
# Load variables into the math function and run it.
scoreboard players operation #InSeconds gameVariable = TimeInTicks gameVariable
scoreboard players operation #Every20Ticks gameVariable = TimeInTicks gameVariable
function calamity:math/divide_by_twenty

# When #Every20Ticks equals 0, a second has passed. Play a sound.
execute if score #Every20Ticks gameVariable matches 0 run playsound minecraft:block.note_block.bit master @a 217 100 195 999999 0.7



# Check our progress. Announce to the player when enough time has passed.
# 15, 10, and 5 seconds
execute if score TimeInTicks gameVariable matches 300 run tellraw @a {"translate":"%s Match begins in %s seconds","color":"green","with":[{"text":">>>","color":"white"},{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}
execute if score TimeInTicks gameVariable matches 200 run tellraw @a {"translate":"%s Match begins in %s seconds","color":"green","with":[{"text":">>>","color":"white"},{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}
execute if score TimeInTicks gameVariable matches 100 run tellraw @a {"translate":"%s Match begins in %s seconds","color":"green","with":[{"text":">>>","color":"white"},{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}
# 4 seconds to 1 seconds...
execute if score TimeInTicks gameVariable matches 80 run tellraw @a {"translate":"%s %s...","color":"green","with":[{"text":">>>","color":"white"},{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}
execute if score TimeInTicks gameVariable matches 60 run tellraw @a {"translate":"%s %s...","color":"green","with":[{"text":">>>","color":"white"},{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}
execute if score TimeInTicks gameVariable matches 40 run tellraw @a {"translate":"%s %s...","color":"green","with":[{"text":">>>","color":"white"},{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}
execute if score TimeInTicks gameVariable matches 20 run tellraw @a {"translate":"%s %s...","color":"green","with":[{"text":">>>","color":"white"},{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}

# It's time to start the game!
function calamity:game_state/check_if_start_conditions_met
execute if score #PlayersPlaying gameVariable matches 0 run tellraw @a {"translate":"%s At least one player must be on a team to start a match","color":"red","with":[{"text":">>>","color":"white"}]}
execute if score #PlayersPlaying gameVariable matches 0 run function calamity:game_state/trigger_cancel_start

execute if score TimeInTicks gameVariable matches 0 if score #PlayersPlaying gameVariable matches 1.. run function calamity:game_state/start_match

# This function is run every tick as long as this
execute if score TimeInTicks gameVariable matches 1.. run scoreboard players remove TimeInTicks gameVariable 1