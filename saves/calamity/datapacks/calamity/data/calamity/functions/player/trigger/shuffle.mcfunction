# Called from: calamity:game_state/tick_lobby

#>--------------------------------------------------------------------------------------------------
#> Purpose: A player has requested to shuffle players onto a teams. Let's do it intelligently.
#>--------------------------------------------------------------------------------------------------

# We'll first handle "shuffle rest of the players" option, which is /trigger shuffle (default: 1).
# This command stores the success count of a test. The test in this next line is
#   "if entity @a[team=]".
execute store result score #AvailablePlayers gameVariable if entity @a[team=]
    # If no players are available to be shuffled, return error and end call 
    execute if entity @a[scores={shuffle=1}] if score #AvailablePlayers gameVariable matches 0 run tellraw @a {"translate":"calamity.shuffle.error.noAvailablePlayers","color":"gray","italic": true}
    execute if entity @a[scores={shuffle=1}] if score #AvailablePlayers gameVariable matches 0 run scoreboard players reset @a shuffle
    execute if entity @a[scores={shuffle=1}] if score #AvailablePlayers gameVariable matches 0 run scoreboard players enable @a shuffle

# Next, we can take the results of the previous section and add it how we handle "shuffle all".
#   This means we're going to count the players on the blue and red teams and then add them to
#   #AvailablePlayers, which is our variable 
execute store result score #BluePlayers gameVariable if entity @a[team=blue]
execute store result score #RedPlayers gameVariable if entity @a[team=red]
scoreboard players operation #AvailablePlayers gameVariable += #BluePlayers gameVariable
scoreboard players operation #AvailablePlayers gameVariable += #RedPlayers gameVariable
    # If no players are available to be shuffled, return error and end call 
    execute if entity @a[scores={shuffle=2}] if score #AvailablePlayers gameVariable matches 0 run tellraw @a {"translate":"calamity.shuffle.error.noAvailablePlayers","color":"gray","italic": true}
    execute if entity @a[scores={shuffle=2}] if score #AvailablePlayers gameVariable matches 0 run scoreboard players reset @a shuffle
    execute if entity @a[scores={shuffle=2}] if score #AvailablePlayers gameVariable matches 0 run scoreboard players enable @a shuffle

# We know that players are available, and that we're going to shuffle some players. We're going to
#   run a function which is recursive. This function will run until no players are left on
execute if entity @a[scores={shuffle=1}] if score #AvailablePlayers gameVariable matches 1.. run function calamity:game_state/shuffle_players

# Shuffle all players
execute if entity @a[scores={shuffle=2}] if score #AvailablePlayers gameVariable matches 1.. run team leave @a[team=red]
execute if entity @a[scores={shuffle=2}] if score #AvailablePlayers gameVariable matches 1.. run team leave @a[team=blue]
execute if entity @a[scores={shuffle=2}] if score #AvailablePlayers gameVariable matches 1.. run function calamity:game_state/shuffle_players

# Always enable shuffle during lobby stage
scoreboard players reset @a shuffle
scoreboard players enable @a shuffle