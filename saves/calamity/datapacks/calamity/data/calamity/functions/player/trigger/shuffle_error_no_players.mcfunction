# Called from: calamity:player/trigger/shuffle

#>--------------------------------------------------------------------------------------------------
#> Purpose: A player has tried to use the shuffle command, but no players are available
#>--------------------------------------------------------------------------------------------------

# Advise the server that no players are available to be shuffled
tellraw @a {"translate":"calamity.shuffle.error.noFreePlayers","color":"gray","italic": true}

# Enable the trigger for all players
scoreboard players reset @a shuffle
scoreboard players enable @a shuffle