# Called from: self, moesh:player/trigger/shuffle

#>--------------------------------------------------------------------------------------------------
#> Purpose: A player has requested to shuffle players, and there are players to be shuffled. This is
#>s   a recursive function. It will run itself as long as there is a player who is not on a team.
#>--------------------------------------------------------------------------------------------------

# Count players who are on a team
scoreboard players set #BluePlayers gameVariable 0
scoreboard players set #RedPlayers gameVariable 0
execute store result score #BluePlayers gameVariable if entity @a[team=blue]
execute store result score #RedPlayers gameVariable if entity @a[team=red]
# Determine if there is a team with less players, then tag players to be added to that team.
#   If teams are equal, we will always prefer the blue team. Why? None of your beeswax, that's why.
execute if score #BluePlayers gameVariable < #RedPlayers gameVariable run tag @r[team=] add ShuffleToBlue
execute if score #BluePlayers gameVariable > #RedPlayers gameVariable run tag @r[team=] add ShuffleToRed
execute if score #BluePlayers gameVariable = #RedPlayers gameVariable run tag @r[team=] add ShuffleToBlue

# We want to track which players have been shuffled so we can send intelligent messages.
team join blue @a[team=,tag=ShuffleToBlue]
team join red @a[team=,tag=ShuffleToRed]

# We're about to send a message about teams. Teams have a suffix that will be displayed after each
#   player name. Let's hide those briefly while we send these messages, then add them back
#   afterwards. This will make the messages cleaner.
execute unless entity @a[team=] if entity @a[scores={shuffle=1..2}] run team modify blue suffix {"translate":""}
execute unless entity @a[team=] if entity @a[scores={shuffle=1..2}] run team modify red suffix {"translate":""}
    # "Shuffle rest" has finished running
    execute unless entity @a[team=] if entity @a[scores={shuffle=1}] run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.shuffle.playerShuffled.rest","color": "green","with":[{"selector":"@a[scores={shuffle=1}]"}]}]}
    execute unless entity @a[team=] if entity @a[scores={shuffle=1}] if entity @a[tag=ShuffleToBlue] run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.shuffle.newTeamAdditions","color": "green","with":[{"translate":"spacer.middle","color":"blue","with":[{"translate":"team.blue"}, {"translate":"b","font": "calamity:icons"}]},{"selector":"@a[tag=ShuffleToBlue]"}]}]}
    execute unless entity @a[team=] if entity @a[scores={shuffle=1}] if entity @a[tag=ShuffleToRed] run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.shuffle.newTeamAdditions","color": "green","with":[{"translate":"spacer.middle","color":"red","with":[{"translate":"team.red"}, {"translate":"r","font": "calamity:icons"}]},{"selector":"@a[tag=ShuffleToRed]"}]}]}
    # "Shuffle all" has finished running
    execute unless entity @a[team=] if entity @a[scores={shuffle=2}] run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.shuffle.playerShuffled.all","color": "green","with":[{"selector":"@a[scores={shuffle=2}]","color": "white"}]}]}
    execute unless entity @a[team=] if entity @a[scores={shuffle=2}] if entity @a[team=blue] run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.shuffle.newTeam","color": "green","with":[{"translate":"spacer.middle","color":"blue","with":[{"translate":"team.blue"}, {"translate":"b","font": "calamity:icons"}]},{"selector":"@a[team=blue]"}]}]}
    execute unless entity @a[team=] if entity @a[scores={shuffle=2}] if entity @a[team=red] run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.shuffle.newTeam","color": "green","with":[{"translate":"spacer.middle","color":"red","with":[{"translate":"team.red"}, {"translate":"r","font": "calamity:icons"}]},{"selector":"@a[team=red]"}]}]}
# Add the team prefix back!
execute unless entity @a[team=] if entity @a[scores={shuffle=1..2}] run team modify blue suffix {"translate":"spacer.left","color":"blue","with": [{"translate":"b","font":"calamity:icons"}]}
execute unless entity @a[team=] if entity @a[scores={shuffle=1..2}] run team modify red suffix {"translate":"spacer.left","color":"red","with": [{"translate":"r","font":"calamity:icons"}]}
# We're done here, forget about players who were shuffled.
execute unless entity @a[team=] if entity @a[scores={shuffle=1..2}] if entity @a[tag=ShuffleToRed] run tag @a remove ShuffleToBlue
execute unless entity @a[team=] if entity @a[scores={shuffle=1..2}] if entity @a[tag=ShuffleToRed] run tag @a remove ShuffleToRed

# If players still need to be shuffled, run this command again.
execute if entity @a[team=] run function calamity:game_state/shuffle_players