# Called from: calamity:game_state/tick_match

#>--------------------------------------------------------------------------------------------------
#> Purpose: "Good game" mechanic. If a match is not going well, why force players to play through
#>  the whole match? Let them keep their dignity and GG the heck out of there.
#>--------------------------------------------------------------------------------------------------

# Mark players who have run the gg trigger
tag @a[team=blue,gamemode=!spectator,scores={gg=1..}] add ForfeitTriggered
tag @a[team=red,gamemode=!spectator,scores={gg=1..}] add ForfeitTriggered
scoreboard players set @a[scores={gg=1..}] gg 0

# If the player retriggers gg remove their forfeit vote
tag @a[tag=ForfeitTriggered,tag=VotedForfeit] add StopForfeit
tag @a[tag=ForfeitTriggered,tag=!VotedForfeit] add VotedForfeit
tag @a[tag=ForfeitTriggered,tag=StopForfeit] remove VotedForfeit
tag @a[tag=ForfeitTriggered,tag=StopForfeit] remove StopForfeit

#>--------------------------------------------------------------------------------------------------
# Blue team forfeit
#>--------------------------------------------------------------------------------------------------

# Count the amount of players on blue team
# And count the players who has voted for forfeit
execute store result score #tempPlayerCount gameVariable run execute if entity @a[team=blue]
scoreboard players operation #tempPlayerCount gameVariable *= PercentPlayersToForfeit mapRules
scoreboard players operation #tempPlayerCount gameVariable /= 100 CONST
execute store result score #tempForfeitCount gameVariable run execute if entity @a[team=blue,tag=VotedForfeit]

# Tell players on the team someone wants to forfeit
execute if entity @a[team=blue,tag=ForfeitTriggered,tag=VotedForfeit] if score #tempPlayerCount gameVariable > #tempForfeitCount gameVariable run tellraw @a[team=blue] {"translate":"system.message","color": "green","with":[{"translate":"calamity.forfeit.started","color": "green","with":[{"selector":"@s"},{"score":{"name": "#tempForfeitCount","objective": "gameVariable"}},{"score":{"name": "#tempPlayerCount","objective": "gameVariable"}},{"text":"/trigger gg","color":"blue","underlined":true,"clickEvent":{"action":"suggest_command","value":"/trigger gg"},"hoverEvent":{"action":"show_text","value":{"translate":"calamity.hover.sendTriggerCommand"}}}]}]}
execute if entity @a[team=blue,tag=ForfeitTriggered,tag=!VotedForfeit] if score #tempForfeitCount gameVariable matches 0 run tellraw @a[team=blue] {"translate":"system.message","color": "green","with":[{"translate":"calamity.voting.retracted.stopped","with":[{"selector":"@s"}]}]}
execute if entity @a[team=blue,tag=ForfeitTriggered,tag=!VotedForfeit] if score #tempForfeitCount gameVariable matches 1.. run tellraw @a[team=blue] {"translate":"system.message","color": "green","with":[{"translate":"calamity.forfeit.retracted","with":[{"selector":"@s"},{"score":{"name": "#tempForfeitCount","objective": "gameVariable"}},{"score":{"name": "#tempPlayerCount","objective": "gameVariable"}}]}]}

# Check if the whole blue team has forfeited
scoreboard players set #tempBlueForfeit gameVariable 0
execute if entity @a[team=blue,tag=VotedForfeit] if score #tempPlayerCount gameVariable <= #tempForfeitCount gameVariable run scoreboard players set #tempBlueForfeit gameVariable 1

#>--------------------------------------------------------------------------------------------------
# Red team forfeit
#>--------------------------------------------------------------------------------------------------

# Count the amount of players on red team
execute store result score #tempPlayerCount gameVariable run execute if entity @a[team=red]
scoreboard players operation #tempPlayerCount gameVariable *= PercentPlayersToForfeit mapRules
scoreboard players operation #tempPlayerCount gameVariable /= 100 CONST

execute store result score #tempForfeitCount gameVariable run execute if entity @a[team=red,tag=VotedForfeit]

# Tell players on the team someone wants to forfeit
execute if entity @a[team=red,tag=ForfeitTriggered,tag=VotedForfeit] if score #tempPlayerCount gameVariable > #tempForfeitCount gameVariable run tellraw @a[team=red] {"translate":"system.message","color": "green","with":[{"translate":"calamity.forfeit.started","with":[{"selector":"@s"},{"score":{"name": "#tempForfeitCount","objective": "gameVariable"}},{"score":{"name": "#tempPlayerCount","objective": "gameVariable"}},{"text":"/trigger gg","color":"blue","underlined":true,"clickEvent":{"action":"suggest_command","value":"/trigger gg"},"hoverEvent":{"action":"show_text","value":{"translate":"calamity.hover.sendTriggerCommand"}}}]}]}
execute if entity @a[team=red,tag=ForfeitTriggered,tag=!VotedForfeit] if score #tempForfeitCount gameVariable matches 0 run tellraw @a[team=red] {"translate":"system.message","color": "green","with":[{"translate":"calamity.voting.retracted.stopped","with":[{"selector":"@s"}]}]}
execute if entity @a[team=red,tag=ForfeitTriggered,tag=!VotedForfeit] if score #tempForfeitCount gameVariable matches 1.. run tellraw @a[team=red] {"translate":"system.message","color": "green","with":[{"translate":"%s has retracted their forfeit vote. %s out of the needed %s players on the team have voted to forfeit the game.","with":[{"selector":"@s"},{"score":{"name": "#tempForfeitCount","objective": "gameVariable"}},{"score":{"name": "#tempPlayerCount","objective": "gameVariable"}}]}]}

# Check if the whole red team has forfeited
scoreboard players set #tempRedForfeit gameVariable 0
execute if entity @a[team=red,tag=VotedForfeit] if score #tempPlayerCount gameVariable <= #tempForfeitCount gameVariable run scoreboard players set #tempRedForfeit gameVariable 1

#>--------------------------------------------------------------------------------------------------
# Check forfeit scores
#>--------------------------------------------------------------------------------------------------

# It's possible for both teams to forfeit at the exact same time.
# If one or both team forfeited and give the correct message based on that.
execute if score #tempBlueForfeit gameVariable matches 1 if score #tempRedForfeit gameVariable matches 1 run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.forfeit.draw","color":"green"}]}
execute if score #tempBlueForfeit gameVariable matches 1 if score #tempRedForfeit gameVariable matches 0 run function calamity:game_state/toast/blue_forfeits
execute if score #tempBlueForfeit gameVariable matches 0 if score #tempRedForfeit gameVariable matches 1 run function calamity:game_state/toast/red_forfeits

# End the game if a team has forfeited
execute if score #tempBlueForfeit gameVariable matches 0..1 if score #tempRedForfeit gameVariable matches 0..1 run function calamity:game_state/end_match

# Reset scores and tags
tag @a[tag=ForfeitTriggered] remove ForfeitTriggered
scoreboard players reset #tempTeamForfeited gameVariable
scoreboard players reset #tempPlayerCount gameVariable
scoreboard players reset #tempBlueForfeit gameVariable
scoreboard players reset #tempRedForfeit gameVariable