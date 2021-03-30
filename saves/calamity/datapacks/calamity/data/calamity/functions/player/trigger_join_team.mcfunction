# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: A player wants to join or leave a team, let them.
#---------------------------------------------------------------------------------------------------

# Join a team
team join blue @a[scores={selectTeam=1}]
execute as @a[scores={selectTeam=1},gamemode=spectator] run function calamity:player/set_to_lobby_mode
execute as @a[scores={selectTeam=1}] run tellraw @a {"translate":">>> %s joined Blue", "color":"blue", "with":[{"selector":"@s[scores={selectTeam=1}]"}]}
team join red @a[scores={selectTeam=2}]
execute as @a[scores={selectTeam=2},gamemode=spectator] run function calamity:player/set_to_lobby_mode
execute as @a[scores={selectTeam=2}] run tellraw @a {"translate":">>> %s joined Red", "color":"red", "with":[{"selector":"@s[scores={selectTeam=2}]"}]}
team join spectator @a[scores={selectTeam=3}]
gamemode spectator @a[scores={selectTeam=3}]
execute as @a[scores={selectTeam=3}] run tellraw @a {"translate":">>> %s moved to the sidelines","color": "gray", "with":[{"selector":"@s[scores={selectTeam=3}]"}]}

# Leave your team
tag @a[team=blue,scores={leaveTeam=1..}] remove JoinBlue
tag @a[team=red,scores={leaveTeam=1..}] remove JoinRed
team leave @a[scores={leaveTeam=1..}]
execute as @a[scores={leaveTeam=1..}] run tellraw @a {"translate":">>> %s abandoned hope", "color":"gray", "with":[{"selector":"@s[scores={leaveTeam=1..}]"}]}

# Always reset triggers if the score is not zero. We've already processed them, so let's just
#   prep them to be enabled.
scoreboard players set @a[scores={selectTeam=..-1}] selectTeam 0
scoreboard players set @a[scores={selectTeam=1..}] selectTeam 0
scoreboard players set @a[scores={leaveTeam=..-1}] leaveTeam 0
scoreboard players set @a[scores={leaveTeam=1..}] leaveTeam 0

# Always enable triggers
scoreboard players enable @a selectTeam
scoreboard players reset @a[team=!] readyTeam
scoreboard players enable @a[team=blue] leaveTeam
scoreboard players enable @a[team=blue] readyTeam
scoreboard players enable @a[team=red] leaveTeam
scoreboard players enable @a[team=red] readyTeam
scoreboard players enable @a[team=spectator] leaveTeam