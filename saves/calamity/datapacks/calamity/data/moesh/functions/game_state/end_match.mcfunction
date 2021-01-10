# Called from: moesh:tick, moesh:player/gg

#---------------------------------------------------------------------------------------------------
# Purpose: Reset the map and player states to neutral
#---------------------------------------------------------------------------------------------------
# Make the announcement
tellraw @a {"translate":">>> %s","color":"white","with":[{"text":"The match is over.","color":"green"}]}
playsound minecraft:event.raid.horn master @a 217 100 195 999999 0.75

# Make all players spectators!
execute as @s at @s run function moesh:player/spectate

# The match has ended, let's updated the SessionID so players are properly handled
execute store result score SessionID gameVariable run time query gametime
scoreboard players operation @a SessionID = SessionID gameVariable

# Allow players to reset the map themselves
tellraw @a {"translate":"Thanks for playing! Use [%s] to play again.","color":"green","with":[{"text":"/trigger reset","color":"white","clickEvent":{"action":"suggest_command","value":"/trigger reset"},"hoverEvent":{"action":"show_text","value":"Click here to send the command to your text box."}}]}

# Update player triggers
scoreboard players reset @a gg
scoreboard players reset @a reset
scoreboard players enable @a reset

#---------------------------------------------------------------------------------------------------
# Purpose: Update game state
#---------------------------------------------------------------------------------------------------
scoreboard players set GameState gameVariable 2