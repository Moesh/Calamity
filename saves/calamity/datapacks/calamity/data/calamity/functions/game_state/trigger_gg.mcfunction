# Called from: calamity:game_state/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Let a player quit the game early.
#---------------------------------------------------------------------------------------------------

# Mark players who have run the gg trigger
tag @a[team=blue,gamemode=!spectator,scores={gg=1..}] add ForfeitTriggered
tag @a[team=red,gamemode=!spectator,scores={gg=1..}] add ForfeitTriggered
scoreboard players set @a[scores={gg=1..}] gg 0

# If the player retriggers gg remove their forfeit vote
tag @a[tag=ForfeitTriggered,tag=VotedForfeit] add StopForfeit
tag @a[tag=ForfeitTriggered,tag=!VotedForfeit] add VotedForfeit
tag @a[tag=ForfeitTriggered,tag=StopForfeit] remove VotedForfeit
tag @a[tag=ForfeitTriggered,tag=StopForfeit] remove StopForfeit

#-----------------
# Blue team forfeit
#-----------------

# Count the amount of players on blue team
# And count the players who has voted for forfeit
execute store result score #tempPlayerCount gameVariable run execute if entity @a[team=blue]
scoreboard players operation #tempPlayerCount gameVariable *= PercentPlayersToForfeit mapRules
scoreboard players operation #tempPlayerCount gameVariable /= 100 CONST
execute store result score #tempForfeitCount gameVariable run execute if entity @a[team=blue,tag=VotedForfeit]

# Tell players on the team someone wants to forfeit
execute if entity @a[team=blue,tag=ForfeitTriggered,tag=VotedForfeit] if score #tempPlayerCount gameVariable > #tempForfeitCount gameVariable run tellraw @a[team=blue] {"translate":">>> %s has voted to forfeit the game. %s out of the needed %s players have voted to forfeit. Use [%s] to vote.","with":[{"selector":"@s"},{"score":{"name": "#tempForfeitCount","objective": "gameVariable"}},{"score":{"name": "#tempPlayerCount","objective": "gameVariable"}},{"text":"/trigger gg","color":"green","clickEvent":{"action":"suggest_command","value":"/trigger gg"},"hoverEvent":{"action":"show_text","value":"Click here to send the command to your text box."}}]}
execute if entity @a[team=blue,tag=ForfeitTriggered,tag=!VotedForfeit] if score #tempForfeitCount gameVariable matches 0 run tellraw @a[team=blue] {"translate":">>> %s has retracted their forfeit vote. Voting stopped.","with":[{"selector":"@s"}]}
execute if entity @a[team=blue,tag=ForfeitTriggered,tag=!VotedForfeit] if score #tempForfeitCount gameVariable matches 1.. run tellraw @a[team=blue] {"translate":">>> %s has retracted their forfeit vote. %s out of the needed %s players on the team have voted to forfeit the game.","with":[{"selector":"@s"},{"score":{"name": "#tempForfeitCount","objective": "gameVariable"}},{"score":{"name": "#tempPlayerCount","objective": "gameVariable"}}]}

# Check if the whole blue team has forfeited
scoreboard players set #tempBlueForfeit gameVariable 0
execute if entity @a[team=blue,tag=VotedForfeit] if score #tempPlayerCount gameVariable <= #tempForfeitCount gameVariable run tellraw @a {"translate":">>> Blue has forfeited!"}
execute if entity @a[team=blue,tag=VotedForfeit] if score #tempPlayerCount gameVariable <= #tempForfeitCount gameVariable run scoreboard players set #tempBlueForfeit gameVariable 1


#-----------------
# Red team forfeit
#-----------------

# Count the amount of players on red team
execute store result score #tempPlayerCount gameVariable run execute if entity @a[team=red]
scoreboard players operation #tempPlayerCount gameVariable *= PercentPlayersToForfeit mapRules
scoreboard players operation #tempPlayerCount gameVariable /= 100 CONST

execute store result score #tempForfeitCount gameVariable run execute if entity @a[team=red,tag=VotedForfeit]

# Tell players on the team someone wants to forfeit
execute if entity @a[team=red,tag=ForfeitTriggered,tag=VotedForfeit] if score #tempPlayerCount gameVariable > #tempForfeitCount gameVariable run tellraw @a[team=red] {"translate":">>> %s has voted to forfeit the game. %s out of the needed %s players have voted to forfeit. Use [%s] to vote.","with":[{"selector":"@s"},{"score":{"name": "#tempForfeitCount","objective": "gameVariable"}},{"score":{"name": "#tempPlayerCount","objective": "gameVariable"}},{"text":"/trigger gg","color":"green","clickEvent":{"action":"suggest_command","value":"/trigger gg"},"hoverEvent":{"action":"show_text","value":"Click here to send the command to your text box."}}]}
execute if entity @a[team=red,tag=ForfeitTriggered,tag=!VotedForfeit] if score #tempForfeitCount gameVariable matches 0 run tellraw @a[team=red] {"translate":">>> %s has retracted their forfeit vote. Voting stopped.","with":[{"selector":"@s"}]}
execute if entity @a[team=red,tag=ForfeitTriggered,tag=!VotedForfeit] if score #tempForfeitCount gameVariable matches 1.. run tellraw @a[team=red] {"translate":">>> %s has retracted their forfeit vote. %s out of the needed %s players on the team have voted to forfeit the game.","with":[{"selector":"@s"},{"score":{"name": "#tempForfeitCount","objective": "gameVariable"}},{"score":{"name": "#tempPlayerCount","objective": "gameVariable"}}]}

# Check if the whole red team has forfeited
scoreboard players set #tempRedForfeit gameVariable 0
execute if entity @a[team=red,tag=VotedForfeit] if score #tempPlayerCount gameVariable <= #tempForfeitCount gameVariable run tellraw @a {"translate":">>> Red has forfeited!"}
execute if entity @a[team=red,tag=VotedForfeit] if score #tempPlayerCount gameVariable <= #tempForfeitCount gameVariable run scoreboard players set #tempRedForfeit gameVariable 1


#---------------------
# Check forfeit scores
#---------------------

# It's possible for both teams to forfeit at the exact same time.
# So we check if one or both team forfeited and give the correct message based on that.
execute if score #tempBlueForfeit gameVariable matches 1 if score #tempRedForfeit gameVariable matches 1 run tellraw @a {"translate":"%s It's a draw!","color":"gold","with":[{"text":">>>","color":"white"}]}
execute if score #tempBlueForfeit gameVariable matches 1 if score #tempRedForfeit gameVariable matches 0 run tellraw @a {"translate":"%s Red wins!","color":"red","with":[{"text":">>>","color":"white"}]}
execute if score #tempBlueForfeit gameVariable matches 0 if score #tempRedForfeit gameVariable matches 1 run tellraw @a {"translate":"%s Blue wins!","color":"blue","with":[{"text":">>>","color":"white"}]}

# End the game if a team has forfeited
execute if score #tempBlueForfeit gameVariable matches 1 if score #tempRedForfeit gameVariable matches 1 run function calamity:game_state/end_match
execute if score #tempBlueForfeit gameVariable matches 0 if score #tempRedForfeit gameVariable matches 1 run function calamity:game_state/end_match
execute if score #tempBlueForfeit gameVariable matches 1 if score #tempRedForfeit gameVariable matches 0 run function calamity:game_state/end_match

# Reset scores and tags
tag @a[tag=ForfeitTriggered] remove ForfeitTriggered
scoreboard players reset #tempTeamForfeited gameVariable
scoreboard players reset #tempPlayerCount gameVariable
scoreboard players reset #tempBlueForfeit gameVariable
scoreboard players reset #tempRedForfeit gameVariable
