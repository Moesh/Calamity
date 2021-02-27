# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: A player wants to join or leave a team, let them.
#---------------------------------------------------------------------------------------------------

# Flag player to be added to team if not on team
tag @a[team=!blue,scores={teamSelected=1}] add JoinBlue
tag @a[team=!red,scores={teamSelected=2}] add JoinRed
tag @a[scores={spectate=1..}] add Spectate

# Remove player if already on that team
tag @a[team=blue,scores={teamSelected=1}] add LeaveTeam
tag @a[team=red,scores={teamSelected=2}] add LeaveTeam
tag @a[scores={leaveTeam=1..}] add LeaveTeam

# Leave your team
tag @a[team=blue,tag=LeaveTeam] remove JoinBlue
tag @a[team=red,tag=LeaveTeam] remove JoinRed
team leave @a[tag=LeaveTeam]
execute as @a[tag=LeaveTeam] run tellraw @a {"translate":">>> %s abandoned their people.", "color":"gray","italic":true, "with":[{"selector":"@s[tag=LeaveTeam]"}]}


team join blue @a[tag=JoinBlue]
execute as @a[tag=JoinBlue] run tellraw @a {"translate":">>> %s sided with %s.","italic":true, "with":[{"selector":"@s[tag=JoinBlue]"}, {"translate":"Blue"}]}
team join red @a[tag=JoinRed]
execute as @a[tag=JoinRed] run tellraw @a {"translate":">>> %s sided with %s.","italic":true, "with":[{"selector":"@s[tag=JoinRed]"}, {"translate":"Red"}]}
team leave @a[tag=Spectate]
execute as @a[tag=Spectate] run tellraw @a {"translate":">>> %s is spectating.", "color":"gray","italic":true, "with":[{"selector":"@s[tag=Spectator]"}]}

# Always reset triggers if the score is not zero. We've already processed them, so let's just
#   prep them to be enabled.
scoreboard players set @a[scores={teamSelected=..-1}] teamSelected 0
scoreboard players set @a[scores={teamSelected=1..}] teamSelected 0
scoreboard players set @a[scores={leaveTeam=..-1}] leaveTeam 0
scoreboard players set @a[scores={leaveTeam=1..}] leaveTeam 0
scoreboard players set @a[scores={spectate=..-1}] spectate 0
scoreboard players set @a[scores={spectate=1..}] spectate 0

# Enable triggers based on what
scoreboard players enable @a[team=] teamSelected
scoreboard players enable @a[team=blue] leaveTeam
scoreboard players enable @a[team=red] leaveTeam
scoreboard players enable @a[gamemode=spectator] leaveTeam


tag @a[tag=JoinBlue] remove JoinBlue
tag @a[tag=JoinRed] remove JoinRed


tag @a[tag=Spectate] remove Spectate
tag @a[tag=LeaveTeam] remove LeaveTeam