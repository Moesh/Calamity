# Called from: calamity:tick, calamity:player/gg

#>--------------------------------------------------------------------------------------------------
#> Purpose: Reset the map and player states to neutral
#>--------------------------------------------------------------------------------------------------

# Make the announcement
playsound minecraft:event.raid.horn master @a 136 150 89 999999 0.75

# Make all players spectators!
gamemode spectator @a

# The match has ended, let's updated the SessionID so players are properly handled
execute store result score SessionID gameVariable run time query gametime
scoreboard players operation @a sessionID = SessionID gameVariable

# Update player triggers
scoreboard players reset @a resetSpawnItem
scoreboard players reset @a gg
scoreboard players reset @a reset
scoreboard players enable @a reset

# Remove tags
tag @a remove VotedForfeit
tag @a remove ResetTheSpawnItem

# Allow players to reset the map themselves
tellraw @a {"translate":"system.message","with": [{"translate":"calamity.reset.map","color":"green","with":[{"text":"/trigger reset","color":"blue","underlined": true,"clickEvent":{"action":"suggest_command","value":"/trigger reset"},"hoverEvent":{"action":"show_text","value":{"translate":"calamity.hover.sendTriggerCommand"}}}]}]}

# Update game state
scoreboard players set GameState gameVariable 2