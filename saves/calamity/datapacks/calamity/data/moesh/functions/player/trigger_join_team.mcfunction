# Called from: moesh:tick

#---------------------------------------------------------------------------------------------------
# Purpose: A player wants to join or leave a team, let them.
#---------------------------------------------------------------------------------------------------

# Flag player to be added to team if not on team
tag @a[team=!blue,scores={teamSelected=1}] add JoinBlue
tag @a[team=!red,scores={teamSelected=2}] add JoinRed
tag @a[scores={teamSelected=3}] add Spectate

# Remove player if already on that team
tag @a[team=blue,scores={teamSelected=1}] add LeaveTeam
tag @a[team=red,scores={teamSelected=2}] add LeaveTeam
# This is so players can use triggers to leave their team if they please.
tag @a[scores={teamSelected=4}] add LeaveTeam

# Leave your team
tag @a[team=blue,tag=LeaveTeam] remove JoinBlue
tag @a[team=red,tag=LeaveTeam] remove JoinRed
team leave @a[tag=LeaveTeam]
execute as @a[tag=LeaveTeam] run tellraw @a {"translate":">>> %s abandoned their people.", "color":"gray","italic":true, "with":[{"selector":"@s[tag=LeaveTeam]"}]}

# Join Blue
team join blue @a[tag=JoinBlue]
execute as @a[tag=JoinBlue] run tellraw @a {"translate":">>> %s sided with %s.","italic":true, "with":[{"selector":"@s[tag=JoinBlue]"}, {"translate":"Blue"}]}

# Join Red
team join red @a[tag=JoinRed]
execute as @a[tag=JoinRed] run tellraw @a {"translate":">>> %s sided with %s.","italic":true, "with":[{"selector":"@s[tag=JoinRed]"}, {"translate":"Red"}]}

# Spectate
team leave @a[tag=Spectate]

# Reset tags
tag @a[tag=JoinBlue] remove JoinBlue
tag @a[tag=JoinRed] remove JoinRed
tag @a[tag=Spectate] remove Spectate
tag @a[tag=LeaveTeam] remove LeaveTeam
scoreboard players set @a[scores={teamSelected=..-1}] teamSelected 0
scoreboard players set @a[scores={teamSelected=1..}] teamSelected 0
scoreboard players enable @a teamSelected